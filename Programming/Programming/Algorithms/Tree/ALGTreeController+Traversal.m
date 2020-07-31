//
//  ALGTreeController+Traversal.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGTreeController+Traversal.h"

@implementation ALGTreeController (Traversal)

#pragma mark -
#pragma mark -- Preorder（先序遍历）根左右
/* 用途：可展示树 */
- (void)preorderTraveral {
    [self preOrder:self.root];
    NSLog(@"\n");
}

- (void)preOrder:(TreeNode *)node {
    if (node) {
        NSLog(@"%d",node.value);
        [self preOrder:node.left];
        [self preOrder:node.right];
    }
}

#pragma mark -
#pragma mark -- inorder（中序遍历）左根右
/* 用途：排序、二分查找 */
- (void)inorderTraveral {
    [self inOrder:self.root];
    NSLog(@"\n");
}

- (void)inOrder:(TreeNode *)node {
    if (node) {
        [self inOrder:node.left];
        NSLog(@"%d",node.value);
        [self inOrder:node.right];
    }
}

#pragma mark -
#pragma mark -- postorder（后序遍历）左右根
/* 用途：可用于删除节点 */
- (void)postorderTraveral {
    [self postOrder:self.root];
    NSLog(@"\n");
}

- (void)postOrder:(TreeNode *)node {
    if (node) {
        [self postOrder:node.left];
        [self postOrder:node.right];
        NSLog(@"%d",node.value);
    }
}

#pragma mark -
#pragma mark -- 层次遍历
- (void)levelOrderTraveral {
    /*层序遍历 思路：按从左至右的顺序来逐层访问每个节点，层序遍历的过程需要队列*/
    
    //初始化一个假队列
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    //将根节点加入队列
    self.root ? [mutableArray addObject:self.root]:nil;
    
    TreeNode *node;
    while ((node = [self leaveQueue:mutableArray])) {
        NSLog(@"%d",node.value);

        [self come:node queue:mutableArray];
    }
}

- (void)come:(TreeNode *)node queue:(NSMutableArray *)queue {
    if (node) {
        node.left ? [queue addObject:node.left]:nil;
        node.right ? [queue addObject:node.right]:nil;
    }
}

- (TreeNode *)leaveQueue:(NSMutableArray *)queue {
    TreeNode *node = [queue firstObject];
    if (node) {
        [queue removeObject:node];
        return node;
    }
    else {
        return nil;
    }
}


@end
