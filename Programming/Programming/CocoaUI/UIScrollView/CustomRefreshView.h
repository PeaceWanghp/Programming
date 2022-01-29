//
//  CustomRefreshView.h
//  Programming
//
//  Created by wangheping on 2022/1/29.
//  Copyright © 2022 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,RefreshStatus)
{
    RefreshStatus_Normal = 1,
    RefreshStatus_BeginRefresh,
    RefreshStatus_Refreshing,
};
 
@interface CustomRefreshView : UIView
 
@property (nonatomic,strong)UILabel *updateLabel;
@property (nonatomic,weak) id actionTarget;
@property (nonatomic)SEL action;
@property (nonatomic,strong) UIScrollView *parentView;
@property (nonatomic) RefreshStatus refreshStatus;
 
-(void)beginHeaderRefresh;
-(void)endHeaderRefresh;
 
-(void)adjustY:(CGFloat)y;

@end

NS_ASSUME_NONNULL_END
