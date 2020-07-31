//
//  ALGLinkController+Copy.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController+Copy.h"

@implementation ALGLinkController (Copy)


- (void)freeLinkCopy {
    OC_LinkNode *headerNode = [self anyNodeLink];
    OC_LinkNode *copyHeaderNode = [self copyLink:headerNode];
    copyHeaderNode = [self hashCopyLink:headerNode];
    copyHeaderNode = [self bestCopyLink:headerNode];
}

- (OC_LinkNode *)copyLink:(OC_LinkNode *)headerNode {
    OC_LinkNode *newHeaderNode;
    OC_LinkNode *aNode;
    while (headerNode) {
        OC_LinkNode *copyNode = [headerNode copy];
        
        if (!newHeaderNode) {
            newHeaderNode = copyNode;
            aNode = copyNode;
        }
        else {
            aNode.nextNode = copyNode;
            aNode = aNode.nextNode;
        }
        
        headerNode = headerNode.nextNode;
    }
    
    aNode = newHeaderNode;
    int value = 0;
    while (aNode) {
        OC_LinkNode *curNode = headerNode;
        while (curNode && value == 0) {
            if (aNode.value == curNode.value) {
                if (curNode.anyNode) {
                    value = curNode.anyNode.value;
                    break;
                }
            }
            curNode = curNode.nextNode;
        }
        
        aNode = aNode.nextNode;
    }
    
    return newHeaderNode;
}

- (OC_LinkNode *)hashCopyLink:(OC_LinkNode *)headerLink {
    
    return nil;
}

- (OC_LinkNode *)bestCopyLink:(OC_LinkNode *)headerLink {
    
    return nil;
}

- (OC_LinkNode *)anyNodeLink {
    OC_LinkNode *headerNode = [self createLink];
    OC_LinkNode *currentNode = headerNode;
    currentNode = currentNode.nextNode.nextNode.nextNode;
    headerNode.anyNode = currentNode;
    
    return headerNode;
}


@end
