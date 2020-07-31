//
//  ALGTreeController.h
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property (nonatomic,assign) int value;
@property (nonatomic,strong) TreeNode *left;
@property (nonatomic,strong) TreeNode *right;
+ (TreeNode *)node:(int)value;
@end

@interface ALGTreeController : BPresentController
@property (nonatomic,strong) TreeNode *root;
- (void)createTree;
@end

NS_ASSUME_NONNULL_END
