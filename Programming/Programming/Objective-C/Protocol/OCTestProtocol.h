//
//  OCTestProtocol.h
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OCTestDelegate.h"

@protocol OCTestInterDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface OCTestProtocol : NSObject

@property (nonatomic,weak) id<OCTestDelegate> delegate;
@property (nonatomic,weak) id<OCTestInterDelegate> interDelegate;

- (void)testAction;
- (void)test2Action;

@end

@protocol OCTestInterDelegate <NSObject>

- (int)testInterProtocol;

@end

NS_ASSUME_NONNULL_END
