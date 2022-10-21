//
//  CULineAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/21.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CULineAnimationViewController.h"

static CGFloat viewWidth = 50;
static CGFloat viewHeight = 20;

@interface CULineAnimationViewController ()

@end

@implementation CULineAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 支持修改属性
//    @property frame
//    @property bounds
//    @property center
//    @property transform
//    @property alpha
//    @property backgroundColor
//    @property contentStretch //ios 6.0已弃用
    
    [self animationOneColor:[UIColor redColor] index:0];
    [self animationTwoColor:[UIColor yellowColor] index:1];

    //    UIViewAnimationOptionLayoutSubviews            //提交动画的时候布局子控件，表示子控件将和父控件一同动画。
    //    UIViewAnimationOptionAllowUserInteraction      //动画时允许用户交流，比如触摸
    //    UIViewAnimationOptionBeginFromCurrentState     //从当前状态开始动画
    [self animationThreeColor:[UIColor blueColor] index:3 option:UIViewAnimationOptionLayoutSubviews];
    [self animationThreeColor:[UIColor grayColor] index:4 option:UIViewAnimationOptionAllowUserInteraction];
    [self animationThreeColor:[UIColor blackColor] index:5 option:UIViewAnimationOptionBeginFromCurrentState];
    

//    UIViewAnimationOptionRepeat                    //动画无限重复
//    UIViewAnimationOptionAutoreverse               //执行动画回路,前提是设置动画无限重复
//    UIViewAnimationOptionOverrideInheritedDuration //忽略外层动画嵌套的执行时间
//    UIViewAnimationOptionOverrideInheritedCurve    //忽略外层动画嵌套的时间变化曲线
//    UIViewAnimationOptionAllowAnimatedContent      //通过改变属性和重绘实现动画效果，如果key没有提交动画将使用快照
//    UIViewAnimationOptionShowHideTransitionViews   //用显隐的方式替代添加移除图层的动画效果
//    UIViewAnimationOptionOverrideInheritedOptions  //忽略嵌套继承的选项
    [self animationThreeColor:[UIColor blueColor] index:6 option:UIViewAnimationOptionRepeat];
    [self animationThreeColor:[UIColor greenColor] index:7 option:UIViewAnimationOptionAutoreverse];
    [self animationThreeColor:[UIColor blueColor] index:8 option:UIViewAnimationOptionOverrideInheritedDuration];
    [self animationThreeColor:[UIColor greenColor] index:9 option:UIViewAnimationOptionOverrideInheritedCurve];
    [self animationThreeColor:[UIColor blueColor] index:10 option:UIViewAnimationOptionAllowAnimatedContent];
    [self animationThreeColor:[UIColor greenColor] index:11 option:UIViewAnimationOptionShowHideTransitionViews];
    [self animationThreeColor:[UIColor blueColor] index:12 option:UIViewAnimationOptionOverrideInheritedOptions];
    
//    UIViewAnimationOptionCurveEaseInOut            //时间曲线函数，由慢到快
//    UIViewAnimationOptionCurveEaseIn               //时间曲线函数，由慢到特别快
//    UIViewAnimationOptionCurveEaseOut              //时间曲线函数，由快到慢
//    UIViewAnimationOptionCurveLinear               //时间曲线函数，匀速
    [self animationThreeColor:[UIColor blueColor] index:14 option:UIViewAnimationOptionCurveEaseInOut];
    [self animationThreeColor:[UIColor greenColor] index:15 option:UIViewAnimationOptionCurveEaseIn];
    [self animationThreeColor:[UIColor blueColor] index:16 option:UIViewAnimationOptionCurveEaseOut];
    [self animationThreeColor:[UIColor greenColor] index:17 option:UIViewAnimationOptionCurveLinear];
    
    //
    //    UIViewAnimationOptionPreferredFramesPerSecondDefault     = 0 << 24,
    //    UIViewAnimationOptionPreferredFramesPerSecond60          = 3 << 24,
    //    UIViewAnimationOptionPreferredFramesPerSecond30          = 7 << 24,
    [self animationThreeColor:[UIColor blueColor] index:29 option:UIViewAnimationOptionPreferredFramesPerSecondDefault];
    [self animationThreeColor:[UIColor greenColor] index:30 option:UIViewAnimationOptionPreferredFramesPerSecond60];
    [self animationThreeColor:[UIColor blueColor] index:31 option:UIViewAnimationOptionPreferredFramesPerSecond30];
}

// animation 3
- (void)animationThreeColor:(UIColor *)color index:(NSInteger)index option:(UIViewAnimationOptions)option {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100+index*viewHeight, viewWidth, viewHeight)];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2
                          delay:1
                        options:option
                     animations:^{
        view.center = CGPointMake(self.view.frame.size.width-viewWidth, view.center.y);
    } completion:^(BOOL finished) {
        NSLog(@"animation finished");
    }];
}

// animation 2
- (void)animationTwoColor:(UIColor *)color index:(NSInteger)index {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100+index*viewHeight, viewWidth, viewHeight)];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2 animations:^{
        CGRect rect = view.frame;
        rect.origin.x = self.view.frame.size.width-viewWidth-10;
        view.frame = rect;
        
        view.backgroundColor = [UIColor systemPinkColor];
    } completion:^(BOOL finished) {
        NSLog(@"animation finished");
    }];
}

// animation 1
- (void)animationOneColor:(UIColor *)color index:(NSInteger)index {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100+index*viewHeight, viewWidth, viewHeight)];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2 animations:^{
        CGRect rect = view.bounds;
        rect.origin.x = 200;
        rect.size.width = 100;
        view.bounds = rect;
        
        CGRect frameRect = view.frame;
        frameRect.origin.x = 200;
        view.frame = frameRect;
        
        view.alpha = 0.2;
    }];
}

@end
