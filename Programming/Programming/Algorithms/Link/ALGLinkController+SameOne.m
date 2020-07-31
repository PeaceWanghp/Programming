//
//  ALGLinkController+SameOne.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+SameOne.h"

@implementation ALGLinkController (SameOne)

- (OC_LinkNode *)createLinkWithNode:(OC_LinkNode *)aNode {
    OC_LinkNode *header = NULL;
    OC_LinkNode *cur = NULL;
    for(int i = 10; i <= 20; ++i) {
        OC_LinkNode * node;
        if (i == 15) {
            node = aNode;
        }
        else {
            node = [[OC_LinkNode alloc] init];
            node.value = i;
        }
        
        node.nextNode = NULL;
        
        if (header == NULL) {
            header = node;
            cur = header;
        }
        else {
            cur.nextNode = node;
            cur = node;
        }
    }
    
    return header;
}

- (void)findSameNode {
    NSLog(@"1.-------------");
    //改变结构法
    [self changeStructure];
    
    NSLog(@"2.-------------");
    //循环嵌套对比查找法
    [self loopCompare];
    
    NSLog(@"3.-------------");
    //求差法
    [self difference];
}

- (void)changeStructure {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    OC_LinkNode *headerNode2 = [self createLinkWithNode:headerNode];
    [self printLink:headerNode2];
    
    OC_LinkNode *currentNode = headerNode;
    while (currentNode) {
        currentNode.isLoop = YES;
        currentNode = currentNode.nextNode;
    }
    
    currentNode = headerNode2;
    while (currentNode) {
        if (currentNode.isLoop) {
            NSLog(@"The same node");
            return;
        }
        currentNode = currentNode.nextNode;
    }
}

- (void)loopCompare {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    OC_LinkNode *headerNode2 = [self createLinkWithNode:headerNode];
    [self printLink:headerNode2];
    
    OC_LinkNode *cur1 = headerNode;
    OC_LinkNode *cur2 = headerNode2;
    while(cur1) {
        while(cur2) {
            if(cur1.value == cur2.value){
                NSLog(@"co-node = %d",cur1.value);
                return;
            }
            else {
                cur2 = cur2.nextNode;
            }
        }
        cur1 = cur1.nextNode;
    }
}

- (void)difference {
    OC_LinkNode *headerNode = [self createLink];
    OC_LinkNode *headerNode2 = [self createLinkWithNode:headerNode];
    
    int n = [self lengthOfLink:headerNode];
    int n2 = [self lengthOfLink:headerNode2];
    if (n == n2) {
        NSLog(@"1111.co-node value = %d",headerNode.value);
    }
    else {
        int m = n > n2 ? n-n2:n2 - n;
        OC_LinkNode *longLink = n > n2 ? headerNode:headerNode2;
        OC_LinkNode *shortLink = n > n2 ? headerNode2:headerNode;
        
        while (longLink) {
            longLink = longLink.nextNode;
            if (m == 0) {
                shortLink = shortLink.nextNode;
                if (longLink.value == shortLink.value) {
                    NSLog(@"2222.co-node value = %d",longLink.value);
                    return;
                }
            }
            else {
                -- m;
            }
        }
    }
}

- (int)lengthOfLink:(OC_LinkNode *)headerNode {
    int i = 0;
    OC_LinkNode *current = headerNode;
    while (current) {
        current = current.nextNode;
        ++ i;
    }
    return i;
}
@end
