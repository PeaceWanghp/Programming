//
//  OCPSetterGetterObject.h
//  Programming
//
//  Created by Peace on 8/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCPSetterGetterObject : NSObject

@property (nonatomic,getter=nikeName,setter=setNikeNge:,copy) NSString *name;
@property (nonatomic,getter=getterAge1,setter=setterAge1:) int age;

@end

NS_ASSUME_NONNULL_END
