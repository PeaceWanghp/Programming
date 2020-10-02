//
//  OC_Test_NSTimer.h
//  Objective-C
//
//  Created by Peace on 12/2/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OC_Test_NSTimer : NSObject

- (void)startTimer;
- (void)blockTimer;
- (void)startWeakTimer;
- (void)startExactTimer;

- (void)invalidateTimer;
- (void)fireTimer;

@end

NS_ASSUME_NONNULL_END
