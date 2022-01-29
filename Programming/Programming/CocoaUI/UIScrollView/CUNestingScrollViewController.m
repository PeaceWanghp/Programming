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

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    // 1.判断下窗口能否接收事件
//    if (!self.userInteractionEnabled ||
//        self.hidden == YES ||
//        self.alpha <= 0.01){
//        return nil;
//    }
//    // 2.判断触摸点在不在窗口上
//    if (![self pointInside:point withEvent:event]){
//        return nil;
//    }
//
//    // 3.从后往前遍历子视图数组
//    int count = (int)self.subviews.count;
//
//    for (int i = count - 1; i >= 0; i--) {
//        // 获取子视图
//        UIView *childView = self.subviews[i];
//        UIResponder *responder = [childView nextResponder];
//        NSLog(@"++++Class:%@:%d",[responder class],childView.tag);
//        if (childView.tag == 888) {
//            return childView;
//        }
//
//        // 坐标系的转换,把窗口上的点转换为子视图上的点
//        // 把自己视图上的点转换成子视图上的点
////        CGPoint childP = [self convertPoint:point toView:childView];
////        UIView *fitView = [childView hitTest:childP withEvent:event];
////        if (fitView) {
////            return fitView;
////        }
//    }
//    // 4.没有找到更合适的view，返回自己
//    return self;
//}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touchesBegan-------[CUHitTestView]");
//    [super touchesBegan:touches withEvent:event];
//
//    for (UIView *next in self.subviews) {
//        UIResponder *responder = [next nextResponder];
//        NSLog(@"++++Class:%@:%d",[responder class],next.tag);
//        if (next.tag == 888) {
//            [next touchesBegan:touches withEvent:event];
//        }
//    }
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    [super touchesMoved:touches withEvent:event];
//
//    for (UIView *next in self.subviews) {
//        UIResponder *responder = [next nextResponder];
//        NSLog(@"++++Class:%@:%d",[responder class],next.tag);
//        if (next.tag == 888) {
//            [next touchesMoved:touches withEvent:event];
//        }
//    }
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesEnded:touches withEvent:event];
//
//    for (UIView *next in self.subviews) {
//        UIResponder *responder = [next nextResponder];
//        NSLog(@"++++Class:%@:%d",[responder class],next.tag);
//        if (next.tag == 888) {
//            [next touchesEnded:touches withEvent:event];
//        }
//    }
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    [super touchesCancelled:touches withEvent:event];
//
//    for (UIView *next in self.subviews) {
//        UIResponder *responder = [next nextResponder];
//        NSLog(@"++++Class:%@:%d",[responder class],next.tag);
//        if (next.tag == 888) {
//            [next touchesCancelled:touches withEvent:event];
//        }
//    }
//}
//
//- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
//    [super touchesEstimatedPropertiesUpdated:touches];
//}


@end

@interface CUNestingScrollViewController ()<UIScrollViewDelegate>
//父UIScrollView
@property (nonatomic, strong) FatherScrollView *fatherscrollView;
//头部区
@property (nonatomic, strong) UIView *headerView;
//子UIScrollView
@property (nonatomic, strong) FatherScrollView *childScrollView;
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
    self.fatherscrollView.tag = 666;
    self.fatherscrollView.delegate = self;
    self.fatherscrollView.bounces = YES;
    self.fatherscrollView.backgroundColor = UIColor.grayColor;
    self.fatherscrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height+1000);
    [self.view addSubview:self.fatherscrollView];
      
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1000)];
    self.headerView.backgroundColor = UIColor.greenColor;
    [self.fatherscrollView addSubview:self.headerView];
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
      
    self.childScrollView = [[FatherScrollView alloc] initWithFrame:CGRectMake(0, 1000, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.childScrollView.tag = 888;
    self.childScrollView.delegate = self;
    self.childScrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height * 1.5);
    self.childScrollView.backgroundColor = UIColor.redColor;
    [self.fatherscrollView addSubview:self.childScrollView];
    [self.fatherscrollView addGestureRecognizer:self.childScrollView.panGestureRecognizer];
    
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

@end
