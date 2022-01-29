//
//  CUInsetScrollViewController.m
//  Programming
//
//  Created by wangheping on 2022/1/29.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUInsetScrollViewController.h"

#import "UIScrollView+Refresh.h"

@interface CUInsetScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *insetHeaderView;
@end

@implementation CUInsetScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width,
                                                                     self.view.frame.size.height-220)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.scrollView.bounds.size.height);
    [self.view addSubview:self.scrollView];
    
//    self.insetHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, -100, self.view.frame.size.width-40, 100)];
//    self.insetHeaderView.backgroundColor = [UIColor purpleColor];
//    [self.scrollView addSubview:self.insetHeaderView];
//    self.scrollView.contentInset = UIEdgeInsetsMake(-100, 0, 0, 0);
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.scrollView.bounds.size.height+100);
    
    
    [self.scrollView addHeaderRefreshWithTarget:self action:@selector(doLoadData)];
}

-(void)doLoadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.scrollView endHeaderRefresh];
    });
}

@end
