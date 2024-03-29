//
//  BPresentHeaderModel.h
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPresentAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPresentHeaderModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) BOOL status;
@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,strong) BPresentAction *action;

@end

NS_ASSUME_NONNULL_END
