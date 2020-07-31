//
//  ALGTreeController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGTreeController.h"

@implementation TreeNode
+ (TreeNode *)node:(int)value {
    TreeNode *node = [[TreeNode alloc] init];
    node.value = value;
    return node;
}
@end

@interface ALGTreeController ()
- (void)searchTree;
- (void)preorderTraveral;
- (void)inorderTraveral;
- (void)postorderTraveral;
- (void)levelOrderTraveral;
@end

@implementation ALGTreeController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.model appendOpenedHeader:@"树"];
    [self.model appendDarkItemTitle:@"自由树" target:self selector:@selector(linkReverse)];
    [self.model appendDarkItemTitle:@"二叉树" target:self selector:@selector(linkReverse)];
    
    //"动态查找树"包括：二叉查找树、平衡二叉树、红黑树、哈夫曼树
    [self.model appendOpenedHeader:@"二叉查找树"];//或称为“二叉搜索树”、“有序二叉树”、“排序二叉树”
    [self.model appendDarkTagItemWithTitle:@"*生成树(通过：插入方式)" target:self selector:@selector(createTree)];
    [self.model appendDarkItemTitle:@"✓查找节点" target:self selector:@selector(searchTree)];
    [self.model appendItemTitle:@"删除节点" target:self selector:@selector(searchTree)];
    [self.model appendDarkItemTitle:@"✓先序遍历(根左右)" target:self selector:@selector(preorderTraveral)];
    [self.model appendDarkItemTitle:@"✓中序遍历(左根右)" target:self selector:@selector(inorderTraveral)];
    [self.model appendDarkItemTitle:@"✓后序遍历(左右根)" target:self selector:@selector(postorderTraveral)];
    [self.model appendDarkItemTitle:@"✓层次遍历" target:self selector:@selector(levelOrderTraveral)];
    [self.model appendItemTitle:@"深度优先" target:self selector:@selector(levelOrderTraveral)];
    [self.model appendItemTitle:@"广度优先" target:self selector:@selector(levelOrderTraveral)];
       
    [self.model appendOpenedHeader:@"平衡二叉树--AVL树"];
    [self.model appendOpenedHeader:@"平衡二叉树--红黑树"];
    [self.model appendOpenedHeader:@"平衡二叉树--哈夫曼树（Huffman Tree）"];
    
    //"多路查找树"包括：B树、B+树、B*树、R树
    [self.model appendOpenedHeader:@"B树"];
    [self.model appendOpenedHeader:@"B+树"];
    [self.model appendOpenedHeader:@"B*树"];
    [self.model appendOpenedHeader:@"R树"];
}


- (void)createTree {
    int array[10] = {5,1,6,13,8,3,2,9,4,7};
    
    int length = 10;
    TreeNode *rootNode;
    for (int i = 0; i < length; ++i) {
        int value = array[i];
        if (i == 0) {
            rootNode = [TreeNode node:value];
        }
        else {
            [self insert:value rootNode:rootNode];
        }
    }
    
    self.root = rootNode;
}

- (void)insert:(int)value rootNode:(TreeNode *)rootNode {
    if (rootNode == nil) {
        return;
    }
    
    TreeNode *insertNode = [TreeNode node:value];
    
    TreeNode *current = rootNode;
    while (true) {
        if (insertNode.value <= current.value) {
            // 如果插入节点的值小于当前节点的值，说明应该插入到当前节点左子树，而此时如果左子树为空，就直接设置当前节点的左子树为插入节点。
            if (current.left == nil) {
                current.left = insertNode;
                return;
            }
            current = current.left;
        }
        else { //如果插入节点的值大于当前节点的值，说明应该插入到当前节点右子树，而此时如果右子树为空，就直接设置当前节点的右子树为插入节点。
            if (current.right == nil) {
                current.right = insertNode;
                return;
            }
            current = current.right;
        }
    }
}


@end
