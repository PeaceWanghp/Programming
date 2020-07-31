//
//  ALGTreeController+Search.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGTreeController+Search.h"

@implementation ALGTreeController (Search)

- (void)searchTree {
    int key = arc4random_uniform(10);
    NSLog(@"key = %d",key);
    [self search:self.root value:key];
}

- (BOOL)search:(TreeNode *)node value:(int)key {
    // 遍历完没有找到，查找失败
    if (node == nil) {
        NSLog(@"not search");
        return NO;
    }
    // 要查找的元素为当前节点，查找成功
    if (key == node.value) {
        NSLog(@"search node = %d",node.value);
        return YES;
    }
    // 继续去当前节点的左子树中查找，否则去当前节点的右子树中查找
    if (key < node.value) {
        return [self search:node.left value:key];
    }
    else {
        return [self search:node.right value:key];
    }
}

@end
