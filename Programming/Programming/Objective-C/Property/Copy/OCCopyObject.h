//
//  OCCopyObject.h
//  Programming
//
//  Created by Peace on 7/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCCopyObject : NSObject <NSCopying,NSMutableCopying>

@property (nonatomic,copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
