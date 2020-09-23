//
//  ALGLinkController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGLinkController.h"

@interface ALGLinkController ()

@end

@implementation ALGLinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"链表节点（增/删/查）"];
    [self.model appendDarkItemTitle:@"✓查倒数第K个" target:self selector:@selector(oppositeKth)];
    [self.model appendDarkItemTitle:@"✓查中间节点" target:self selector:@selector(middleNode)];
    [self.model appendDarkItemTitle:@"✓删除节点（穷举O(n)/赋值O(1)）" target:self selector:@selector(deleteNode)];
    [self.model appendDarkItemTitle:@"✓删除所有等值节点" target:self selector:@selector(deleteNode3)];
    [self.model appendDarkItemTitle:@"✓删除重复节点中一个" target:self selector:@selector(deleteNode4)];
    [self.model appendItemTitle:@"删除所有重复节点" target:self selector:@selector(deleteNode5)];
    
    [self.model appendOpenedHeader:@"链表操作"];
    [self.model appendDarkItemTitle:@"✓反转" target:self selector:@selector(linkReverse)];
    [self.model appendDarkItemTitle:@"✓旋转" target:self selector:@selector(spin)];
    [self.model appendDarkItemTitle:@"✓合并" target:self selector:@selector(mergeLink)];
    [self.model appendItemTitle:@"复制复杂链表" target:self selector:@selector(freeLinkCopy)];
    
    [self.model appendOpenedHeader:@"链表排序"];
    [self.model appendItemTitle:@"快速排序" target:self selector:@selector(checkLoop)];
    [self.model appendItemTitle:@"插入排序" target:self selector:@selector(checkLoop)];
    
    [self.model appendOpenedHeader:@"链表结构判断"];
    [self.model appendDarkItemTitle:@"✓有环(增Bool/穷举/快慢指针)" target:self selector:@selector(checkLoop)];
    [self.model appendDarkItemTitle:@"✓环长度(快慢指针)" target:self selector:@selector(checkLoopLength)];
    [self.model appendDarkItemTitle:@"✓环入口" target:self selector:@selector(loopNode)];
    [self.model appendDarkItemTitle:@"✓同一节点(增Bool/嵌套循环/差值)" target:self selector:@selector(findSameNode)];
    [self.model appendDarkItemTitle:@"两个链表的共同节点" target:self selector:@selector(findSameNode)];
}

#pragma mark -
#pragma mark -- Custom
- (OC_LinkNode *)createLink {
    OC_LinkNode *header = NULL;
    OC_LinkNode *cur = NULL;
    int count = arc4random_uniform(5) + 10;
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
    }
    
    return header;
}

- (void)printLink:(OC_LinkNode *)headerNode {
    NSMutableString *output = [NSMutableString string];
    while(headerNode != NULL) {
        [output appendFormat:@"%d",headerNode.value];
        
        headerNode = headerNode.nextNode;
        if (headerNode != NULL) {
            [output appendString:@"->"];
        }
        
        if (output.length > 100) {//避免死循环，默认100
            NSLog(@"%@",output);
            return;
        }
    }
    NSLog(@"%@",output);
}

@end

@implementation OC_LinkNode
- (instancetype)initWithInt:(int)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}
- (instancetype)copyWithZone:(NSZone *)zone {
    OC_LinkNode *node = [[OC_LinkNode allocWithZone:zone] init];
    node.value = self.value;
    node.isLoop = self.isLoop;
    return node;
}
- (void)dealloc {
    NSLog(@"%s %d",__func__,_value);
}
@end
