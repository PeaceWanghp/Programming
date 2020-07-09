//
//  OCTestDelegate.h
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCTestDelegate <NSObject>

@required
- (int)testProtocol;
@optional
- (int)testOptionalProtocol;

@end

NS_ASSUME_NONNULL_END
