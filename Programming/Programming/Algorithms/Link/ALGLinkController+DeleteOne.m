//
//  ALGLinkController+DeleteOne.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+DeleteOne.h"

@implementation ALGLinkController (DeleteOne)

- (void)deleteNode {
    NSLog(@"-------------%s",__func__);
    //穷举
    [self deleteNode1];
    //赋值
    [self deleteNode2];
}

- (OC_LinkNode *)randomNode:(OC_LinkNode *)headerNode {
    NSUInteger r = arc4random_uniform(5) + 1;
    OC_LinkNode *currentNode = headerNode;
    while (currentNode) {
        if (currentNode.value == r) {
            return currentNode;
        }
        
        currentNode = currentNode.nextNode;
    }
    
    return nil;
}

//穷举方式删除节点
- (void)deleteNode1 {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    OC_LinkNode *deleteNode = [self randomNode:headerNode];
    NSLog(@"delete node = %d",deleteNode.value);
    
    OC_LinkNode *currentNode = headerNode;
    OC_LinkNode *previousNode = nil;
    while (currentNode) {
        if (deleteNode.value == currentNode.value) {
            if (previousNode) {
                previousNode.nextNode = currentNode.nextNode;
            }
            else {
                headerNode = headerNode.nextNode;
            }
            break;
        }
        previousNode = currentNode;
        currentNode = currentNode.nextNode;
    }
    
    [self printLink:headerNode];
}

//赋值删除
- (void)deleteNode2 {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    OC_LinkNode *deleteNode = [self randomNode:headerNode];
    NSLog(@"delete node = %d",deleteNode.value);
    
    OC_LinkNode *nextNode = deleteNode.nextNode;
    if (nextNode) {
        deleteNode.value = nextNode.value;
        deleteNode.isLoop = nextNode.isLoop;
        deleteNode.nextNode = nextNode.nextNode;
    }
    else {
        NSLog(@"last one");
    }
    
    [self printLink:headerNode];
}

//删除链表中等于给定值的所有节点
- (void)deleteNode3 {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    int value = arc4random_uniform(10);
    NSLog(@"delete value = %d",value);
    
    //构建虚拟头节点
    OC_LinkNode *dummyHeader = [[OC_LinkNode alloc] init];
    dummyHeader.nextNode = headerNode;
    
    OC_LinkNode *pre = dummyHeader;
    OC_LinkNode *cur = dummyHeader.nextNode;
    while (cur) {
        if (cur.value == value) {
            pre.nextNode = cur.nextNode;
        }
        pre = pre.nextNode;
        cur = cur.nextNode;
    }
    [self printLink:dummyHeader.nextNode];
}

//删除排序链表中重复的节点只保留一个
- (void)deleteNode4 {
    OC_LinkNode *headerNode = [self createLink];
    OC_LinkNode *aNode = [[OC_LinkNode alloc] initWithInt:1];
    aNode.nextNode = headerNode;
    headerNode = aNode;
    [self printLink:headerNode];
    
    OC_LinkNode *pre = headerNode;
    OC_LinkNode *cur = headerNode.nextNode;
    while (cur) {
        if (pre.value == cur.value) {
            pre.nextNode = cur.nextNode;
        }
        pre = pre.nextNode;
        cur = cur.nextNode;
    }
    [self printLink:headerNode];
}

//删除排序链表中所有重复的节点
- (void)deleteNode5 {
    //生成链表
    OC_LinkNode *headerNode = [[OC_LinkNode alloc] initWithInt:1];
    OC_LinkNode *aNode = [[OC_LinkNode alloc] initWithInt:1];
    headerNode.nextNode = aNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:1];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:2];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:3];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:4];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:5];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:6];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:6];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:7];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:7];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:7];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:8];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:9];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:10];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:11];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:12];
    aNode = aNode.nextNode;
    aNode.nextNode = [[OC_LinkNode alloc] initWithInt:12];
    aNode = aNode.nextNode;
    
    //加虚拟头
    OC_LinkNode *dummyHeader = [[OC_LinkNode alloc] initWithInt:0];
    dummyHeader.nextNode = headerNode;
    
    [self printLink:dummyHeader];
    
    //计算
    OC_LinkNode *cur = dummyHeader;
    while (cur) {
        OC_LinkNode *aNode = cur.nextNode;
        OC_LinkNode *markNode = aNode;
        while (aNode) {
            OC_LinkNode *nextNode = aNode.nextNode;
            if (aNode.value == nextNode.value) {
                aNode = aNode.nextNode;
            }
            else {
                NSLog(@"markNode = %d; aNode = %d; nextNode = %d",markNode.value,aNode.value,nextNode.value);
                break;
            }
        }
        cur.nextNode = aNode;
        
        cur = cur.nextNode;
    }
    [self printLink:dummyHeader.nextNode];
}

@end
