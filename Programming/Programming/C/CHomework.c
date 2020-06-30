//
//  CHomework.c
//  Programming
//
//  Created by Peace on 6/29/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#include "CHomework.h"

#include <math.h>

void FtoC() {
    float F = 136.4;
    scanf("%f", &F);
    printf("--->输入华氏度：%.2f\n", F);
    float C = 5.0/9.0*(F-32.0);
    printf("--->输出摄氏度： %.2f\n", C);
}

void formolu() {
    double x = 7.03, y;
    scanf("%lf", &x);
    printf("--->输入x:%.4lf\n",x);
    if (x <= 0) {
        y = sin(x);
    }
    else if (x > 0 && x <= 10) {
        y = exp(2*x) + 1;
    }
    else {
        y = sqrt(pow(x,3) + pow(x,2) + 1);
    }
    
    printf("--->输出：x = %.4lf, y = %.4lf\n", x, y);
}

void score() {
    float score = 0.f;
    printf("Input a score (0~100)\n");
    scanf("%f", &score);
    printf("--->输入得分：%f\n", score);
    
    int grade;
    
    if (score >= 0.f && score <= 100.f) {
        grade = score/10;
    }
    else {
        printf("Over Range!");
        return;
    }
    
    switch (grade) {
        case 10:
        case 9: printf("A [90,100]"); break;
        case 8: printf("B [80,90]"); break;
        case 7: printf("C [70,80]"); break;
        case 6: printf("D [60,70]"); break;
        case 5:
        case 4:
        case 3:
        case 2:
        case 1:
        case 0: printf("E [0,60]"); break;
    }
}
