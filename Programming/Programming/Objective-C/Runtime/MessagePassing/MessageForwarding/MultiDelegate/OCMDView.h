//
//  OCMDView.h
//  Programming
//
//  Created by Peace on 7/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCMDViewDelegate;

@interface OCMDView : NSObject <UIScrollViewDelegate>
@property (nonatomic,weak) id<OCMDViewDelegate>delegate;
@end

@protocol OCMDViewDelegate <NSObject>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
