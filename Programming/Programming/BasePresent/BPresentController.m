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
- (void)refrushData:(NSInteger)index {
    BPresentHeaderModel *headerModel = [_model.dataSource objectAtIndex:index];
    headerModel.status = !headerModel.status;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark -- TabelView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _model.dataSource.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headerIdentifier = @"headerIdentifier";
    BPresentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (!header) {
        header = [[BPresentHeaderView alloc] initWithIdentifier:headerIdentifier];
    }
    
    BPresentHeaderModel *headerModel = [_model.dataSource objectAtIndex:section];
    header.title = headerModel.title;
    header.subTitle = headerModel.status ? @"收起":@"展开";
    header.index = section;
    __weak typeof(self) weakSelf = self;
    header.block = ^ (NSInteger index){
        BPresentHeaderModel *headerModel = [weakSelf.model.dataSource objectAtIndex:index];
        headerModel.status = !headerModel.status;
        [weakSelf.tableView reloadData];
    };
    
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BPresentHeaderModel *headerModel = [_model.dataSource objectAtIndex:section];
    return headerModel.status ? headerModel.items.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    BPresentHeaderModel *headerModel = [_model.dataSource objectAtIndex:indexPath.section];
    BPresentItemModel *itemModel = headerModel.items[indexPath.row];
    cell.textLabel.text = itemModel.displayTitle;
    
    return cell;
}

#pragma mark -
#pragma mark -- TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BPresentHeaderModel *headerModel = [_model.dataSource objectAtIndex:indexPath.section];
    BPresentItemModel *itemModel = headerModel.items[indexPath.row];
 
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
