//
//  CUFirstViewController.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUFirstViewController.h"

#import "CUSecondViewController.h"
#import "CUItemEntity.h"
#import "CUItemCell.h"

#import "CUFirstTransition.h"

@interface CUFirstViewController () <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray *items;
@end

@implementation CUFirstViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.items = [[self class] exampleThings];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}

#pragma mark - Transition Delegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (fromVC == self && [toVC isKindOfClass:[CUSecondViewController class]]) {
        return [CUFirstTransition new];
    }
    else {
        return nil;
    }
}

#pragma mark - TableView Delegate&DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CUItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CUItemCell.description];
    if (nil == cell) {
        cell = [[CUItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CUItemCell.description];
    }
    [cell setUpData:self.items[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CUSecondViewController *vc = [CUSecondViewController new];
    vc.entity = self.items[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100.0;
        [_tableView registerClass:CUItemCell.class forCellReuseIdentifier:CUItemCell.description];
    }
    return _tableView;
}

#pragma mark - Data
+ (NSArray*)exampleThings {
    return @[
        [[CUItemEntity alloc] initWithTitle:@"Thing 1" image:[UIImage imageNamed:@"thing1.jpg"] overview:@"Drumstick cow beef fatback turkey boudin. Meatball leberkas boudin hamburger pork belly fatback."],
        [[CUItemEntity alloc] initWithTitle:@"Thing 2" image:[UIImage imageNamed:@"thing2.jpg"] overview:@"Shank pastrami sirloin, sausage prosciutto spare ribs kielbasa tri-tip doner."],
        [[CUItemEntity alloc] initWithTitle:@"Thing 3" image:[UIImage imageNamed:@"thing3.jpg"] overview:@"Frankfurter cow filet mignon short loin ham hock salami meatloaf biltong andouille bresaola prosciutto."],
        [[CUItemEntity alloc] initWithTitle:@"Thing 4" image:[UIImage imageNamed:@"thing4.jpg"] overview:@"Pastrami sausage turkey shank shankle corned beef."],
        [[CUItemEntity alloc] initWithTitle:@"Thing 5" image:[UIImage imageNamed:@"thing5.jpg"] overview:@"Tri-tip short loin pork belly, pastrami biltong ball tip ham hock. Shoulder ribeye turducken shankle."]
             ];
}

@end
