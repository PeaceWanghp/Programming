//
//  CHomeworkSecond.c
//  Programming
//
//  Created by Peace on 7/2/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#include "CHomeworkSecond.h"

#include <string.h>

/*输入两个非零自然数，计算并分别输出它们的最大公约数和最小公倍数。*/

/* 求最大公约数 */
int gcd(int m , int n)
{
    while(m != n){
        if(m > n)
            m -= n;
        else
            n -= m;
    }
    
    return m;
}

/* 求最小公倍数 */
int gcp(int m , int n)
{
    return m * n / gcd(m,n);
}

void gcdAndGcp()
{
    int a=3,b=5,maxgcd,mingcp;
//    sacnf("%d%d",&a,&b);
    maxgcd = gcd(a,b);
    mingcp = gcp(a,b);
    printf("a=%d,b=%d,最大公约数=%d,最小公倍数=%d\n",a,b,maxgcd,mingcp);
}

/*一百匹马将二百块砖驮上山，其中大马每匹驮三块、中马每匹驮两块，而小马两匹驮一块，计算并输出各种马匹数目（非负的整数）。*/
void horse ()
{
    int cock,hen,chicken;
    
    printf("\n三重循环方法:\n");
    for(cock=0;cock<=20;cock++)
        for(hen=0;hen<=33;hen++)
            for(chicken=0;chicken<=100;chicken+=3){
                if(cock+hen+chicken==100&&5*cock+3*hen+chicken/3==100)
                    printf("公鸡=%d,母鸡=%d,小鸡=%d\n",cock,hen,chicken);
            }
    
    printf("二重循环方法:\n");
    for(cock=0;cock<=20;cock++)
      for(hen=0;hen<=33;hen++) {
          chicken=100-cock-hen;
          if(7*cock+4*hen==100)
              printf("公鸡=%d,母鸡=%d,小鸡=%d\n",cock,hen,chicken);
      }
    
    
    int bHorseMAX = (200-200%3)/3;
    int mHorseMAX = 200/2;
    int lHorseMAX = 100;
    printf("\n大马最多=%d,中马最多=%d,小马最多=%d\n",bHorseMAX,mHorseMAX,lHorseMAX);
    
    int bHorse,mHorse,lHorse;
    printf("\n三重循环方法:\n");
    
    for (bHorse = 0; bHorse <= bHorseMAX; bHorse ++) {
        for (mHorse = 0; mHorse <= mHorseMAX; mHorse ++) {
            for (lHorse = 0; lHorse <= lHorseMAX; lHorse += 2) {
                if (bHorse + mHorse + lHorse == 100 && bHorse*3 + mHorse*2 + lHorse/2 == 200) {
                    printf("大马=%d,中马=%d,小马=%d\n",bHorse,mHorse,lHorse);
                }
            }
        }
    }
    
    printf("\n二重循环方法:\n");
    for (bHorse = 0; bHorse <= bHorseMAX; bHorse ++) {
        for (mHorse = 0; mHorse <= mHorseMAX; mHorse ++) {
            lHorse = 100 - bHorse - mHorse;
            if (lHorse%2 == 0 && bHorse*3 + mHorse*2 + lHorse/2 == 200) {
                printf("大马=%d,中马=%d,小马=%d\n",bHorse,mHorse,lHorse);
            }
        }
    }
}

/*将一字符串输入到数组（长度不超过80）后将其输出，将其中的英文字母大小写互换后再将整个字符串输出。*/
void stringTransform() {
    char s1[] = "d%kjfkdSL!DJKJ我";
    printf("%s\n",s1);
//    gets(s1);
    for (int i = 0; i < strlen(s1); i ++) {
        if (s1[i]>='a' && s1[i] <= 'z')
            s1[i] -= 32;
        else if (s1[i] >= 'A' && s1[i] <= 'Z')
            s1[i] += 32;
    }
//    puts(s1);
    printf("%s",s1);
}

/*按下列形式使用循环生成一个十阶的矩阵A（下三角）到二维数组中，再输出。*/
void outputTriangle() {
    int a[10][10];
    for (int i = 0; i < 10; i ++) {
        for (int j = 0; j < 10; j ++) {
            if (j <= i)
                a[i][j] = j+1;
            else
                a[i][j] = 0;
        }
    }
    
    for (int i = 0; i < 10; i ++) {
        for (int j = 0; j < 10; j ++) {
            printf("%-2d",a[i][j]);
        }
        printf("\n");
    }
}
