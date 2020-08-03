//
//  CExamController.m
//  Programming
//
//  Created by Peace on 7/19/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CExamController.h"

#include "Exam.h"

@interface CExamController ()

@end

@implementation CExamController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"1.输出九九表" target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"2." target:self selector:@selector(triangleArea)];
    [self.model appendItemTitle:@"3." target:self selector:@selector(outLetter)];
    [self.model appendItemTitle:@"4." target:self selector:@selector(vowelCount)];
    [self.model appendItemTitle:@"5." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"6." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"7." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"8." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"9." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"10." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"11." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"12." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"13." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"14." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"15." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"16." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"17." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"18." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"19." target:self selector:@selector(multiplicationTable)];
    [self.model appendItemTitle:@"20." target:self selector:@selector(multiplicationTable)];
}

//1.输出九九表
- (void)multiplicationTable {
    first();
}

//2.任意输入三条辨（a,b,c），若能构成三角形计算其面积，判断是否为等腰、等边、直角或任意，否则输出“不能构成三角形”
- (void)triangleArea {
    
}

//3.正序和反序打印英文字母
- (void)outLetter {
    
}

//4.输入一个字符串（换行作为结束）统计元音字母（a,A;e,E;i,I;o,O;u,U）各自出现的次数
- (void)vowelCount {
    
}

//5.将一个三位数输入后反向输出（如123，输出321）
- (void)inverseNumber {
    
}

//6.公鸡5元只，母鸡3元/只，小鸡3只/元，100元钱买100只鸡,求出所有的答案
- (void)buyChicken {
    
}

//7.输入年（year）,月（month）和日（day）,计算并输出该日是该年的第几天（sumdays）
- (void)yearMonthDay {
    
}

//8.矩阵转置
- (void)matrix {
    
}

//9.分别用一维和二维数组输出杨辉三角形
- (void)pascalTriangle {
    
}

//10.输出字符串
- (void)outChar {
    
}

//11.指针数组和二级指针的使用
- (void)pointerArray {
    
}

//12.求两个自然数的最大公约数(greatest common divisor)和最小公倍数(least common multiple)
- (void)gcdAndgcp {
    
}

//13.对下列分段函数，输入x的值后，计算并输出y的值（保留两位小数）
- (void)formulaComputing {
    
}

//14.++,--的理解与适用
- (void)plusAndminus {
    
}

//15.输入学生成绩后，输出其字母等级
- (void)letterGrade {
    
}

//16.选择排序（升序）注意会识别降序
- (void)selectionSort {
    
}

//17.值传递和地址传递
- (void)valueAndAddress {
    
}

//18.有一个磁盘文件，第一次将它的内容显示在屏幕上，第二次把它复制到另一个文件上
- (void)fileManager {
    
}

//19.输入实数x, 按下列公式计算并输出x和y的值（小数点后保留3位）
- (void)formula2 {
    
}

//20.(1)编写一个计算摄氏度到华氏度转换的函数。函数头是float temp(float c)，计算公式：F=9/5+32.
//(2)编写主函数从键盘输入摄氏温度的值，调用上述函数输出摄氏及华氏度的值（小数点后保留两位）
- (void)temperature {
    
}

@end
