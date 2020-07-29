//
//  CHomeworkController.m
//  Programming
//
//  Created by Peace on 6/29/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CHomeworkController.h"

#import "CHomework.h"
#import "CHomeworkSecond.h"

@interface CHomeworkController ()

@end

@implementation CHomeworkController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"First"];
    [self.model appendItemTitle:@"F/C" target:self selector:@selector(FtoC)];
    [self.model appendItemTitle:@"formulo" target:self selector:@selector(formulo)];
    [self.model appendItemTitle:@"score" target:self selector:@selector(score)];
    
    [self.model appendOpenedHeader:@"Second"];
    [self.model appendItemTitle:@"1.最大公約數/最小公倍數" target:self selector:@selector(test1)];
    [self.model appendItemTitle:@"2.一百匹馬馱二百塊磚" target:self selector:@selector(test2)];
    [self.model appendItemTitle:@"3.字符串小寫轉大寫" target:self selector:@selector(test3)];
    [self.model appendItemTitle:@"4.輸出下三角在10*10矩陣中" target:self selector:@selector(test4)];
    
    [self.model appendOpenedHeader:@"Third"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
}

#pragma mark -
#pragma mark -- Third

#pragma mark -
#pragma mark -- Second
- (void)test1 {
    gcdAndGcp();
}

- (void)test2 {
    horse();
}

- (void)test3 {
    stringTransform();
}

- (void)test4 {
    outputTriangle();
}

#pragma mark -
#pragma mark -- First
- (void)FtoC {
    NSLog(@"Hit %s",__func__);
    FtoC();
}

- (void)formulo {
    formolu();
}

- (void)score {
    score();
}

#pragma mark -
#pragma mark -- Public
- (void)todo {
 
}

@end
