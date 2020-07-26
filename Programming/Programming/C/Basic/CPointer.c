//
//  CPointer.c
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#include "CPointer.h"

void test1() {
    int a, b, temp, *p, *q;
    a = 110;
    b = 120;
    p = &a;
    q = &b;
    printf("原始数据：%d,%d,%d,%d\n",a,b,*p,*q);
    
    temp = *p;
    *p = *q;
    *q = temp;
    printf("交换指针：%d,%d,%d,%d\n",a,b,*p,*q);
    
    temp = a;
    a = b;
    b = temp;
    printf("交换变量：%d,%d,%d,%d",a,b,*p,*q);
}
