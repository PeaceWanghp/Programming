//
//  ALGOtherController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGOtherController.h"

@interface ALGOtherController ()

@end

@implementation ALGOtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"独二元素" target:self selector:@selector(onlyTwo)];
}

- (void)todo {
    
}

#pragma mark -
#pragma mark -- 独二元素
/*
有一个整数的数组a[N],
对于其中的元素a[i],
如果其前面a[0]~a[i-1]中，
如果有且仅有一个元素比它大，
我们称之为独二元素。
设计一个函数，
输入一个数组a[N],
找出其中所有的独二元素，
并输出出来，
如果没有这种元素，
什么也不干；要求时间复杂度是O(n).
比如，输入数组：
[10,9,9,8,11,10,12,11]
里面的独二元素：
第2个位置的9
第3个位置的9
第6个位置的10，
最后的11。
那么输出就是[9,9,10,11].
 */
- (void)onlyTwo {
    int a[8] = {10,9,9,8,11,10,12,11};
    int b[8] = {8,9,0,1,11,4,12,4};
    int c[8] = {-8,9,0,-1,11,4,-12,4};
    onlytwoMethod(c);
}

void onlytwoMethod(int a[]) {
    int value = a[0],value1 = a[1];
    if (value > value1) {
        printf("%d,",value1);
    }
    
    for (int i = 2; i < 8; i ++) {
        int tmp = a[i];
//        NSLog(@"tmp = %d",tmp);
        
//        NSLog(@"value = %d, value1 = %d",value,value1);
        if (tmp > value) {
            value1 = value > value1 ? value:value1;
            value = tmp;
        }
//        NSLog(@"value = %d, value1 = %d",value,value1);
        
        if ((value > tmp && value1 <= tmp) || (value1 > tmp && value <= tmp)) {
            printf("%d,",tmp);
        }
    }
}

@end
