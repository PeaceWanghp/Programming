//
//  BPresentController.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentController.h"

#import "BPresentHeaderView.h"

@interface BPresentController ()

@end

@implementation BPresentController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [[BPresentModel alloc] init];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Custom
- (void)todo {
    
}

- (void)refrushData:(NSInteger)index {
    if (_model.groupDataSource.count == 0) {
        return;
    }
    
    BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:index];
    headerModel.status = !headerModel.status;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark -- TabelView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_model.groupDataSource.count > 0) {
        return _model.groupDataSource.count;
    }
    else {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_model.groupDataSource.count == 0) {
        return nil;
    }
    
    static NSString *headerIdentifier = @"headerIdentifier";
    BPresentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (!header) {
        header = [[BPresentHeaderView alloc] initWithIdentifier:headerIdentifier];
    }
    
    BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:section];
    header.title = headerModel.title;
    header.subTitle = headerModel.status ? @"收起":@"展开";
    header.index = section;
    __weak typeof(self) weakSelf = self;
    header.block = ^ (NSInteger index){
        BPresentHeaderModel *headerModel = [weakSelf.model.groupDataSource objectAtIndex:index];
        headerModel.status = !headerModel.status;
        [weakSelf.tableView reloadData];
    };
    
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:section];
        return headerModel.status ? headerModel.items.count:0;
    }
    else {
        return _model.dataSource.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BPresentItemModel *itemModel;
    if (_model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [_model.dataSource objectAtIndex:indexPath.row];
    }
    
    return itemModel.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    BPresentItemModel *itemModel;
    if (_model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [_model.dataSource objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = itemModel.displayTitle;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = itemModel.dark ? [UIColor blackColor]:[UIColor grayColor];
    
    return cell;
}

#pragma mark -
#pragma mark -- TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BPresentItemModel *itemModel;
    if (_model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [_model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [_model.dataSource objectAtIndex:indexPath.row];
    }
 
    if (itemModel.className) {
        UIViewController *viewController = [[itemModel.className alloc] init];
        viewController.title = itemModel.title;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else {
        [itemModel.target performSelector:itemModel.selector];
        
        if (itemModel.tag > -1) {
            [itemModel selected];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = itemModel.displayTitle;
        }
    }
}

@end
