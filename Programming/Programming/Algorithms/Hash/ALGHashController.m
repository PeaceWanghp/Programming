//
//  ALGHashController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGHashController.h"

@interface ALGHashController ()

@end

@implementation ALGHashController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"散列表/哈希表"];
    [self.model appendItemTitle:@"✓哈希查找(数组)" target:self selector:@selector(hashSearch)];
    [self.model appendItemTitle:@"哈希查找(数组+链表)" target:self selector:@selector(hashSearch)];
}

- (void)hashSearch {
    static int hashLength = 7;
    int hashTable[hashLength];
    
    int list[7] = {13,29,27,28,26,30,38};
    
    // 创建哈希表
    for (int i = 0; i < hashLength; i++) {
        [self insert:hashTable value:list[i]];
    }
    
    int hashAddress = [self search:hashTable value:38];
    NSLog(@"hashAddress = %d",hashAddress);
}

- (int)search:(int[])hashTable value:(int)value {
    // 哈希函数，除留余数法
    int hashAddress = [self hash:7 value:value];

    while (hashTable[hashAddress] != value) {
        // 利用 开放定址法 解决冲突
        ++hashAddress;
        hashAddress = hashAddress % 7;
        // 查找到开放单元 或者 循环回到原点，表示查找失败
        if (hashTable[hashAddress] == 0 || hashAddress == [self hash:7 value:value]) {
            return -1;
        }
    }
    // 查找成功，返回下标
    return hashAddress;
}

- (void)insert:(int[])hashTable value:(int)value {
    int hashAddress = [self hash:7 value:value];
    
    while (hashTable[hashAddress] != 0) {
        ++hashAddress;
        hashAddress = hashAddress % 7;
    }
    NSLog(@"-------- insert %d at %d",value,hashAddress);
    hashTable[hashAddress] = value;
}

- (int)hash:(int)hashLength value:(int)value {
    return value % hashLength;
}

@end
