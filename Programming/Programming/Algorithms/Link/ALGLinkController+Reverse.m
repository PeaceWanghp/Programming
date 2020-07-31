//
//  ALGLinkController+Reverse.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+Reverse.h"

@implementation ALGLinkController (Reverse)

- (void)linkReverse {
    NSLog(@"%s",__func__);
    
    OC_LinkNode *headerNode = [self createLink];
    
    [self printLink:headerNode];
    
    headerNode = [self reverse:headerNode];
    
    [self printLink:headerNode];
}

- (OC_LinkNode *)reverse:(OC_LinkNode *)headerNode {
    if (headerNode == NULL || headerNode.nextNode == NULL) {
        return headerNode;
    }
        
    OC_LinkNode * previous = headerNode;
    OC_LinkNode * current = headerNode.nextNode;
    previous.nextNode = NULL;
    while(current != NULL) {
        OC_LinkNode *next = current.nextNode;
        current.nextNode = previous;
        previous = current;
        current = next;
    }
    return previous;
}

#pragma mark -
#pragma mark -- 旋转表
- (void)spin {
    NSLog(@"1------------------");
    [self spinLink];
    NSLog(@"2------------------");
    [self spinLink2];
}

#pragma mark -
#pragma mark -- 旋转链表1
- (void)spinLink {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    int random = arc4random_uniform(10);
    NSLog(@"k = %d",random);
    while (random > 0) {
        
        headerNode = [self rightMoveOne:headerNode];
        [self printLink:headerNode];
        
        -- random;
    }
}

- (OC_LinkNode *)rightMoveOne:(OC_LinkNode *)headerNode {
    OC_LinkNode *last = headerNode.nextNode;
    OC_LinkNode *preLast = headerNode;
    while (last.nextNode) {
        preLast = preLast.nextNode;
        last = last.nextNode;
    }
    
    last.nextNode = headerNode;
    preLast.nextNode = nil;
    
    return last;
}


#pragma mark -
#pragma mark -- 旋转链表2
- (void)spinLink2 {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    
    int random = arc4random_uniform(20)+10;
    NSLog(@"k = %d",random);
    
    OC_LinkNode *part_PreNode;
    OC_LinkNode *part_HeaderNode;
    OC_LinkNode *part_LastNode;
    {
        OC_LinkNode *cur = headerNode;
        int i = 0;
        while(cur != NULL & i++ < random) {
            if (!cur.nextNode) {
                cur = headerNode;
            }
            else {
                cur = cur.nextNode;
            }
        }

        OC_LinkNode *now = headerNode;
        OC_LinkNode *pre = headerNode;
        while(cur){
            part_LastNode = cur;
            pre = now;
            now = now.nextNode;
            cur = cur.nextNode;
        }
        part_PreNode = pre;
        part_HeaderNode = pre.nextNode;
    }
    [self printLink:part_PreNode];
    
    part_LastNode.nextNode = headerNode;
    part_PreNode.nextNode = nil;
    
    [self printLink:part_HeaderNode];
}


@end
