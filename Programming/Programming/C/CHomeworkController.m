//
//  CHomeworkController.m
//  Programming
//
//  Created by Peace on 6/29/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CHomeworkController.h"

#import "CHomework.h"

@interface CHomeworkController ()

@end

@implementation CHomeworkController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Homework"];
    [self.model appendItemTitle:@"F/C" target:self selector:@selector(FtoC)];
    [self.model appendItemTitle:@"formulo" target:self selector:@selector(formulo)];
    [self.model appendItemTitle:@"score" target:self selector:@selector(score)];
}

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

@end
