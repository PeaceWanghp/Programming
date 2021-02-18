//
//  OCBlockController.h
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentController.h"

typedef void(^TypedefBlock)(void);

@interface OCBlockController : BPresentController
{
    void(^_classBlock)(void);
}
@property(nonatomic,weak) void(^weakBlock)(void);
@property(nonatomic,strong) void(^strongBlock)(void);
@property(nonatomic,copy) void(^copyBlock)(void);
@property(nonatomic,strong) void(^weakStrongBlock)(void);
@property(nonatomic,copy) TypedefBlock typedefBlock;

@end
