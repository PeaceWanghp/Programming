//
//  OCTestExtension.h
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCTestExtension : NSObject
{
    @private NSString *_string4;
    @public NSString *_string5;
}
@property (nonatomic,copy) NSString *string1;
@property (nonatomic,copy) NSString *string2;
@property (nonatomic,copy) NSString *string3;

@end

NS_ASSUME_NONNULL_END
