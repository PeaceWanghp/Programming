//
//  OCPNullObject.h
//  Programming
//
//  Created by Peace on 8/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCPNullObject : NSObject

@property(nonatomic,null_unspecified,copy) NSString *name;
@property(nonatomic,nullable,copy) NSString *firstName;
@property(nonatomic,nonnull,copy) NSString *lastName;
@property(nonatomic,null_resettable,copy) NSString *nikeName;

- (void)output;

@end

NS_ASSUME_NONNULL_END
