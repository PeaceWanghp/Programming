//
//  ALGLinkController+Loop.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+Loop.h"

@implementation ALGLinkController (Loop)


- (OC_LinkNode *)createLoop {
    int count = arc4random_uniform(10)+10+1;
    int loopValue = arc4random_uniform(20);
    OC_LinkNode *header = NULL;
    OC_LinkNode *cur = NULL;
    OC_LinkNode *loop = NULL;
    for(int i = 1; i <= count; ++i) {
        OC_LinkNode * node = [[OC_LinkNode alloc] init];
        node.value = i;
        node.nextNode = NULL;
        
        if (header == NULL) {
            header = node;
            cur = header;
        }
        else {
            cur.nextNode = node;
            cur = node;
        }
        
        //从第三个开始入环
        if (i == loopValue) {
            loop = node;
        }
    }
    
    //加环
    cur.nextNode = loop;
    
    return header;
}

#pragma mark -
#pragma mark -- 是否有环
- (void)checkLoop_Bool:(OC_LinkNode *)headerNode {
    OC_LinkNode *currentNode = headerNode;
    while (currentNode && !currentNode.isLoop) {
        currentNode.isLoop = YES;
        currentNode = currentNode.nextNode;
    }
    
    if (currentNode && currentNode.isLoop) {
        NSLog(@"Loop");
    }
    else {
        NSLog(@"Not Loop");
    }
}

- (void)checkLoop_Enumeration:(OC_LinkNode *)headerNode {
    OC_LinkNode *currentNode = headerNode;
    while (currentNode) {
        currentNode = currentNode.nextNode;
        if (headerNode.value == currentNode.value) {
            NSLog(@"Loop");
            return;
        }
        else {
            OC_LinkNode *aNode = headerNode;
            while (aNode) {
                if (aNode.value == currentNode.value) {
                    NSLog(@"Loop");
                    return;
                }
                aNode = aNode.nextNode;
            }
        }
    }
    
    NSLog(@"Not Loop");
}

- (OC_LinkNode *)fastAndSlowPonter {
    OC_LinkNode *headerNode = [self createLoop];
    OC_LinkNode *slowNode = headerNode;
    OC_LinkNode *fastNode = headerNode;
    while (slowNode && fastNode) {
        slowNode = slowNode.nextNode;
        fastNode = fastNode.nextNode.nextNode;
        
        if (slowNode.value == fastNode.value) {
            NSLog(@"loop");
            return slowNode;
        }
    }
    
    NSLog(@"not loop");
    return nil;
}

- (void)checkLoop {
    OC_LinkNode *headerNode;
    
    //Book判断
    headerNode = [self createLink];
    [self checkLoop_Bool:headerNode];
    headerNode = [self createLoop];
    [self checkLoop_Bool:headerNode];
    
    //穷举
    headerNode = [self createLink];
    [self checkLoop_Enumeration:headerNode];
    headerNode = [self createLoop];
    [self checkLoop_Enumeration:headerNode];
    
    //快慢指针
    NSLog(@"--------%s",__func__);
    [self fastAndSlowPonter];
}

#pragma mark -
#pragma mark -- 环长度
- (void)checkLoopLength {
    OC_LinkNode *headerNode = [self fastAndSlowPonter];
    OC_LinkNode *currentNode = headerNode;
    int length = 1;
    while (currentNode) {
        currentNode = currentNode.nextNode;
        if (currentNode.value == headerNode.value) {
            NSLog(@"loop length = %d",length);
            return;
        }
        length ++;
    }
}

#pragma mark -
#pragma mark -- 入环节点
- (void)loopNode {
    OC_LinkNode *entryNode = [self entryOfLoop];
    
    NSLog(@"loop entry node = %d",entryNode.value);
}

- (OC_LinkNode *)entryOfLoop {
    OC_LinkNode *headerNode = [self createLoop];
    [self printLink:headerNode];
    
    if(headerNode.nextNode == nil || headerNode.nextNode.nextNode == nil) {
        NSLog(@"not loop");
        return nil;
    }
    
    OC_LinkNode *slow = headerNode.nextNode;
    OC_LinkNode *fast = headerNode.nextNode.nextNode;
    NSLog(@"1.run loop %d:%d",slow.value,fast.value);
    while(fast != nil){
        if(fast == slow){
            fast = headerNode;
            NSLog(@"3.run loop %d:%d",slow.value,fast.value);
            while(fast != slow){
                fast = fast.nextNode;
                slow = slow.nextNode;
                NSLog(@"4.run loop %d:%d",slow.value,fast.value);
            }
            NSLog(@"entry node = %d",fast.value);
            return fast;
        }
        
        slow = slow.nextNode;
        fast = fast.nextNode.nextNode;
        NSLog(@"2.run loop %d:%d",slow.value,fast.value);
    }
    
    return nil;
}


@end
