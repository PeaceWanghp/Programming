//
//  ALGLinkController+Merge.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+Merge.h"

@implementation ALGLinkController (Merge)

- (void)mergeLink {
    OC_LinkNode *headerNode = [self createLink];
    [self printLink:headerNode];
    OC_LinkNode *headerNode2 = [self createLink];
    [self printLink:headerNode2];
    
    OC_LinkNode *mergeHeaderNode = [[OC_LinkNode alloc] init];
    OC_LinkNode *cur = mergeHeaderNode;
    while (headerNode && headerNode2) {
        if (headerNode.value > headerNode2.value) {
            cur.nextNode = headerNode2;
            headerNode2 = headerNode2.nextNode;
        }
        else {
            cur.nextNode = headerNode;
            headerNode = headerNode.nextNode;
        }
        cur = cur.nextNode;
    }
    
    if (!headerNode) {
        cur.nextNode = headerNode2;
    }
    else if (!headerNode2) {
        cur.nextNode = headerNode;
    }
    
    mergeHeaderNode = mergeHeaderNode.nextNode;
    [self printLink:mergeHeaderNode];
}


@end
