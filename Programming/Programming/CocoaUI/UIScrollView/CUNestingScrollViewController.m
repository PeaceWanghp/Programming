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

@property (nonatomic, strong) FatherScrollView *fatherscrollView;//父UIScrollView
@property (nonatomic, strong) UIView *headerView;//头部区
@property (nonatomic, strong) UIScrollView *childScrollView;//子UIScrollView
@property (nonatomic, assign) BOOL enableFatherViewScroll;//父UIScrollView是否能滚动
@property (nonatomic, assign) BOOL enableChildViewScroll;//子UIScrollView是否能滚动

@end

@implementation CUNestingScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.enableChildViewScroll = NO;
    self.enableFatherViewScroll = YES;
      
    [self.view addSubview:self.fatherscrollView];
    [self.fatherscrollView addSubview:self.headerView];
    [self.fatherscrollView addSubview:self.childScrollView];
    
    [self configSubviews];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.fatherscrollView) {
        
        CGFloat contentOffset = 1000 - [UIApplication sharedApplication].statusBarFrame.size.height;
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

#pragma mark - subviews
- (void)configSubviews {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"悬浮标题";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 160, self.view.bounds.size.width, 40);
    label.backgroundColor = UIColor.whiteColor;
    [self.headerView addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = CGRectMake(0, 200,self.view.bounds.size.width,40);
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:button];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:50];
    contentLabel.text = @"子滚动内容";
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.childScrollView addSubview:contentLabel];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.backgroundColor = [UIColor blueColor];
    button1.frame = CGRectMake(0, 140,self.view.bounds.size.width,40);
    [button1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.childScrollView addSubview:button1];
}

- (void)buttonAction {
    NSLog(@"0000000000000000000000000");
}

#pragma mark - Lazy
- (FatherScrollView *)fatherscrollView {
    if (!_fatherscrollView) {
        _fatherscrollView = [[FatherScrollView alloc] initWithFrame:self.view.bounds];
        _fatherscrollView.tag = 666;
        _fatherscrollView.delegate = self;
        _fatherscrollView.bounces = YES;
        _fatherscrollView.backgroundColor = UIColor.grayColor;
        _fatherscrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height+1000);
        [_fatherscrollView addGestureRecognizer:self.childScrollView.panGestureRecognizer];
    }
    return _fatherscrollView;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1000)];
        _headerView.backgroundColor = UIColor.greenColor;
    }
    return _headerView;
}

- (UIScrollView *)childScrollView {
    if (!_childScrollView) {
        _childScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1000, self.view.bounds.size.width, self.view.bounds.size.height)];
        _childScrollView.tag = 888;
        _childScrollView.delegate = self;
        _childScrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height * 1.5);
        _childScrollView.backgroundColor = UIColor.redColor;
    }
    return _childScrollView;
}

@end
