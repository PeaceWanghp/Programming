//
//  CArray.c
//  Programming
//
//  Created by Peace on 7/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#include "CArray.h"

void intArray() {
    //初始化“全部”整形数组元素
    int a[10] = {0,1,2,3,4,5,6,7,8,9};//或int a[] = {0,1,2,3,4,5,6,7,8,9};
    for (int i = 0; i < 10; i ++) {
        printf("%d",a[i]);
    }
    
    //初始化部分整形元素
    int b[10] = {0,1,2,3,4};
    for (int i = 0; i < 10; i ++) {
        printf("%d",b[i]);
    }
    
    //初始化空数组
    int c[10];
    for (int i = 0; i < 10; i ++) {
        c[i] = i;
    }
    for (int i = 0; i < 10; i ++) {
        printf("%d",c[i]);
    }
}

void charArray() {
    //初始化字符数组
    char str[5] = "abcd";//char str[5] = {"abcd"};char str2[] = {"abcd"};char str3[5] = "abcd";char str4[] = "abcd";
    
    //输出
    printf("%s,%s", &str[0], str);
    printf("%s,%s", &str[1], str);
    printf("%s,%s", &str[2], str);
    printf("%s,%s", &str[3], str);
}
