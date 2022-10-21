//
//  BPresentController.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentController.h"

//#import "BPresentHeaderView.h"
//#import "BPresentAction.h"

@interface BPresentController ()

@end

@implementation BPresentController

#pragma mark -
#pragma mark -- Life Cycle

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"1111111111111");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"22222222222222222");
    
    self.model = [[BPresentModel alloc] init];
    
    // 返回按钮
//    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"bt_navigationBar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"< 返回"
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

// 返回按钮的回调方法
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Custom
- (void)todo {
    
}

- (void)refrushData:(NSInteger)index {
    if (self.model.groupDataSource.count == 0) {
        return;
    }
    
    BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:index];
    headerModel.status = !headerModel.status;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark -- TabelView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.model.groupDataSource.count > 0) {
        return self.model.groupDataSource.count;
    }
    else {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.model.groupDataSource.count == 0) {
        return nil;
    }
    
    BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:section];
    
    static NSString *headerIdentifier = @"headerIdentifier";
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerIdentifier];
        BPresentAction *pAction = [BPresentAction new];
        headerModel.action = pAction;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:pAction action:@selector(tapHeaderAction:)];
        [header addGestureRecognizer:tapGesture];
    }
    
    if (headerModel.status) {
        header.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
    }
    else {
        header.contentView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    }
    header.textLabel.text = headerModel.title;
    header.tag = section;
    
    __weak typeof(self) weakSelf = self;
    headerModel.action.block = ^(NSInteger index) {
        BPresentHeaderModel *headerModel = [weakSelf.model.groupDataSource objectAtIndex:index];
        headerModel.status = !headerModel.status;
        [weakSelf.tableView reloadData];
    };
    
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:section];
        return headerModel.status ? headerModel.items.count:0;
    }
    else {
        return self.model.dataSource.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BPresentItemModel *itemModel;
    if (self.model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [self.model.dataSource objectAtIndex:indexPath.row];
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
    if (self.model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [self.model.dataSource objectAtIndex:indexPath.row];
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
    
    NSLog(@"0000000000000000");
    BPresentItemModel *itemModel;
    if (self.model.groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = [self.model.groupDataSource objectAtIndex:indexPath.section];
        itemModel = headerModel.items[indexPath.row];
    }
    else {
        itemModel = [self.model.dataSource objectAtIndex:indexPath.row];
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
