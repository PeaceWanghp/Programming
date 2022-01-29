//
//  CUNestingScrollViewController.m
//  Programming
//
//  Created by wangheping on 2022/1/28.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUNestingScrollViewController.h"

@interface FatherScrollView : UIScrollView<UIGestureRecognizerDelegate>

@end

@implementation FatherScrollView

//支持手势同步到其他接收者
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

@interface CUNestingScrollViewController ()<UIScrollViewDelegate>
//父UIScrollView
@property (nonatomic, strong) FatherScrollView *fatherscrollView;
//头部区
@property (nonatomic, strong) UIView *headerView;
//子UIScrollView
@property (nonatomic, strong) UIScrollView *childScrollView;
//父UIScrollView是否能滚动
@property (nonatomic, assign) BOOL enableFatherViewScroll;
//子UIScrollView是否能滚动
@property (nonatomic, assign) BOOL enableChildViewScroll;
@end

@implementation CUNestingScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.enableChildViewScroll = NO;
    self.enableFatherViewScroll = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
      
    self.fatherscrollView = [[FatherScrollView alloc] initWithFrame:self.view.bounds];
    self.fatherscrollView.delegate = self;
    self.fatherscrollView.bounces = YES;
    self.fatherscrollView.backgroundColor = UIColor.grayColor;
    self.fatherscrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height+600);
    [self.view addSubview:self.fatherscrollView];
      
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 600)];
    self.headerView.backgroundColor = UIColor.greenColor;
    [self.fatherscrollView addSubview:self.headerView];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"悬浮标题";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 160, self.view.bounds.size.width, 40);
    label.backgroundColor = UIColor.whiteColor;
    [self.headerView addSubview:label];
      
    self.childScrollView = [[FatherScrollView alloc] initWithFrame:CGRectMake(0, 600, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.childScrollView.delegate = self;
    self.childScrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height * 1.5);
    self.childScrollView.backgroundColor = UIColor.redColor;
    [self.fatherscrollView addSubview:self.childScrollView];
      
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:50];
    contentLabel.text = @"子滚动内容";
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.childScrollView addSubview:contentLabel];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.fatherscrollView) {
        
        CGFloat contentOffset = 560 - [UIApplication sharedApplication].statusBarFrame.size.height;
        if (!self.enableFatherViewScroll) {
            scrollView.contentOffset = CGPointMake(0, contentOffset);
            self.enableChildViewScroll = YES;
            NSLog(@"1.---------%@",NSStringFromCGPoint(scrollView.contentOffset));
        } else {
            if (scrollView.contentOffset.y >= contentOffset) {
                scrollView.contentOffset = CGPointMake(0, contentOffset);
                if (self.enableFatherViewScroll) {
                    self.enableFatherViewScroll = NO;
                    self.enableChildViewScroll = YES;
                }
            }
            NSLog(@"2.---------%@",NSStringFromCGPoint(scrollView.contentOffset));
        }
    }
    else {
        if (!self.enableChildViewScroll) {
            scrollView.contentOffset = CGPointMake(0, 0);
            NSLog(@"1.==========%@",NSStringFromCGPoint(scrollView.contentOffset));
        } else {
            if (scrollView.contentOffset.y <= 0) {
                self.enableChildViewScroll = NO;
                self.enableFatherViewScroll = YES;
            }
            NSLog(@"2.==========%@",NSStringFromCGPoint(scrollView.contentOffset));
        }
    }
}

@end
