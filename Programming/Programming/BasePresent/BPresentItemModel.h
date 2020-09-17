//
//  BPresentItemModel.h
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPresentItemModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *displayTitle;
@property (nonatomic,strong) Class className;
@property (nonatomic,weak) NSObject *target;
@property (nonatomic,assign) SEL selector;
@property (nonatomic,assign) int tag;//default -1,it's closed.
@property (nonatomic,assign) BOOL dark;//default -1,it's closed.
@property (nonatomic,assign) float height;

- (void)selected;

@end

NS_ASSUME_NONNULL_END
