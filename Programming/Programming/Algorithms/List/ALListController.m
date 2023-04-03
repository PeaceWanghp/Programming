//
//  ALListController.m
//  Programming
//
//  Created by heping wang on 2023/3/27.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "ALListController.h"
#import "ALListReverseString.h"


@interface ALListController ()

@end

@implementation ALListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"字符反转"];
    [self.model appendDarkItemTitle:@"递归法" target:self selector:@selector(recursionMethod)];
    [self.model appendDarkItemTitle:@"双指针法" target:self selector:@selector(recursionMethod)];
}

- (void)recursionMethod {
    int value = plus1(1,2);
    printf("\n puls = %d\n",value);
}

@end
