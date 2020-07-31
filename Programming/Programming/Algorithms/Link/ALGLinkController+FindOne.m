//
//  ALGLinkController+FindOne.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+FindOne.h"

@implementation ALGLinkController (FindOne)

#pragma mark -
#pragma mark -- 找倒数第几个
- (void)oppositeKth {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    OC_LinkNode *aNode = [self findNode:headerNode oppositeKth:3];
    NSLog(@"aNode value = %d",aNode.value);
}

- (OC_LinkNode *)findNode:(OC_LinkNode *)headerNode oppositeKth:(int)k {
    OC_LinkNode *cur = headerNode;
    OC_LinkNode *now = headerNode;
    int i=0;
    while(cur != NULL & i++<k) {
        cur = cur.nextNode;
        
    }
    NSLog(@"i = %d, k = %d, cur.value = %d",i,k,cur.value);

    while(cur != NULL){
      now = now.nextNode;
      cur = cur.nextNode;
    }
    
    return now;
}

#pragma mark -
#pragma mark -- 找中间的一个
- (void)middleNode {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    OC_LinkNode *slow = headerNode;
    OC_LinkNode *fast = headerNode.nextNode;
    while(fast) {
        slow = slow.nextNode;
        fast = fast.nextNode.nextNode;
    }
    
    NSLog(@"aNode value = %d",slow.value);
}

@end
