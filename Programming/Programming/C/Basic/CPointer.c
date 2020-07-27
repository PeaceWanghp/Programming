//
//  CPointer.c
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#include "CPointer.h"

/*
 何谓指针：指针就是地址
 int a;  //声明了：Int型的”普通变量“
 int *p; //声明了：指向目标为Int的”指针变量“
 p = &a; //取a的地址赋值给p
 printf("%d",*p);//取*p的值输出
 */

#pragma mark -
#pragma mark -- Int
void pointerInt() {
    int a, b, temp;//声明了：Int型的”普通变量“
    int *p, *q;//声明了：指向目标为Int的”指针变量“
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

void swapF(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}

void swapT(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void swapP(int *a, int *b) {
    int t = 3;
    int *temp = &t;
//    int *temp; ***Crash
//    int *temp = NULL; ***Crash
    *temp = *a;
    *a = *b;
    *b = *temp;
}

void swapD(int *a, int *b) {
    printf("\na = %p, b = %p",a,b);
    int *temp;
    temp = a;
    a = b;
    b = temp;
    printf("\na = %p, b = %p",a,b);
}

void swapInt () {
    int a = 10, b = 5;
    printf("\n1.a = %d, b = %d",a,b);
    
    swapF(a, b);
    printf("\n2.a = %d, b = %d",a,b);
    
    swapT(&a, &b);
    printf("\n3.a = %d, b = %d",a,b);
    
    int *p = &a, *q = &b;
    swapT(p, q);
    printf("\n4.a = %d, b = %d",a,b);
    
    swapP(&a, &b);
    printf("\n5.a = %d, b = %d",a,b);
    
    //只做了地址交换，值未得到改变
    printf("\na = %p, b = %p",&a,&b);
    swapD(&a, &b);
    printf("\na = %p, b = %p",&a,&b);
    printf("\n6.a = %d, b = %d",a,b);
}

#pragma mark -
#pragma mark -- Array
void pointerArray() {
    int a[5] = {0,3,5,7,9};
    int *p;
    //p = a; <--> p = &a[0];
    p = a;
    
    //第一种：
    for (int i = 0; i < 5; i ++) {
        printf("%d",*(p + i));
    }
    
    printf("\n");
    //第二种：
    for (int i = 0; i < 5; i ++) {
        printf("%d",*p++);
    }
    
    printf("\n");
    //第三种：
    for (int i = 0; i < 5; i ++) {
        printf("%d",*(a + i));
    }
    
    printf("\n");
    //第四种：
    for (int i = 0; i < 5; i ++) {
        printf("%d",a[i]);
    }
}
