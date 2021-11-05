//
//  CUTestPanViewController.m
//  Programming
//
//  Created by wangheping on 2021/9/24.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "CUTestPanViewController.h"

//#import "CUHorizontalScrollView.h"
//#import "CUVerticalScrollView.h"

#pragma mark -
#pragma mark -- CUVerticalScrollView
@interface CUVerticalScrollView : UIScrollView
@end
@implementation CUVerticalScrollView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
@end

#pragma mark -
#pragma mark -- CUHorizontalScrollView
@interface CUHorizontalScrollView : UIScrollView
@end
@implementation CUHorizontalScrollView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        
    }
    return self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
//    return NO;
    
    NSDate *date = [NSDate date];
    NSLog(@"111111111111111 = %f",date.timeIntervalSinceNow);
    CGPoint velocity = [panGestureRecognizer velocityInView:self];
    NSLog(@"2222222222222222 = %f",date.timeIntervalSinceNow);
//    NSLog(@"velocity = %@",NSStringFromCGPoint(velocity));
//    BOOL value = fabs(velocity.x)-50 > fabs(velocity.y);
    
    NSLog(@"3333333333333333 = %f",date.timeIntervalSinceNow);
    return YES;
//    return value;
    
//    NSDate *date = [NSDate date];
//    NSLog(@"111111111111111 = %f",date.timeIntervalSinceNow);
//    CGPoint velocity = [panGestureRecognizer velocityInView:self];
//    NSLog(@"2222222222222222 = %f",date.timeIntervalSinceNow);
//    NSLog(@"velocity = %@",NSStringFromCGPoint(velocity));
////    BOOL value = fabs(velocity.x)-50 > fabs(velocity.y);
//    NSLog(@"3333333333333333 = %f",date.timeIntervalSinceNow);
//    return YES;
//    return value;
}

@end

#pragma mark -
#pragma mark -- Test
@interface CUTestPanViewController ()

@end

@implementation CUTestPanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    
    CUHorizontalScrollView *horizontalScrollView = [[CUHorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    horizontalScrollView.contentSize = CGSizeMake(w*5, 0);
    [self.view addSubview:horizontalScrollView];
    
    for (int i=0; i<5; i++) {
        CUVerticalScrollView *verticalScrollView = [[CUVerticalScrollView alloc] initWithFrame:CGRectMake(i*w, 0, w, h)];
        verticalScrollView.contentSize = CGSizeMake(w, h*5);
        switch (i) {
            case 0:
                verticalScrollView.backgroundColor = [UIColor redColor];
                break;
            case 1:
                verticalScrollView.backgroundColor = [UIColor orangeColor];
                break;
            case 2:
                verticalScrollView.backgroundColor = [UIColor yellowColor];
                break;
            case 3:
                verticalScrollView.backgroundColor = [UIColor greenColor];
                break;
            case 4:
                verticalScrollView.backgroundColor = [UIColor blueColor];
                break;
            default:
                verticalScrollView.backgroundColor = [UIColor whiteColor];
                break;
        }
        [horizontalScrollView addSubview:verticalScrollView];
    }
}

@end
