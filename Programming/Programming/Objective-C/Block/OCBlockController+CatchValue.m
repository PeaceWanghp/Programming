//
//  OCBlockController+CatchValue.m
//  Programming
//
//  Created by Peace on 9/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController+CatchValue.h"

@implementation OCBlockController (CatchValue)

- (void)testSelf {
    NSLog(@"1.%p,%p",self,&self);
    void(^block)(void) = ^{
        NSLog(@"2.%p,%p",self,&self);
        self.view.tag = 4;
        NSLog(@"3.%p,%p",self,&self);
    };
    NSLog(@"4.%p,%p",self,&self);
    block();
    NSLog(@"5.%p,%p",self,&self);
    
    NSLog(@"\n");
    
    __weak typeof(self) weakSelf = self;
    NSLog(@"a.%p,%p",weakSelf,&weakSelf);
    void(^block1)(void) = ^{
        NSLog(@"b.%p,%p",weakSelf,&weakSelf);
        weakSelf.view.tag = 4;
        NSLog(@"c.%p,%p",weakSelf,&weakSelf);
    };
    NSLog(@"d.%p,%p",weakSelf,&weakSelf);
    block1();
    NSLog(@"e.%p,%p",weakSelf,&weakSelf);
    
    NSLog(@"\n");
}

- (void)testInt {
    int value = 5;
    NSLog(@"1.value = %d,%p",value,&value);
    void(^block)(void) = ^{
        NSLog(@"2.value = %d,%p",value,&value);
    };
    NSLog(@"3.value = %d,%p",value,&value);
    value = 6;
    NSLog(@"4.value = %d,%p",value,&value);
    block();
    
    NSLog(@"\n");
}

- (void)testObject {
    NSString *string = @"111111";
    NSLog(@"1.value = %@ : %p,%p",string,string,&string);
    void(^block)(void) = ^{
        NSLog(@"2.value = %@ : %p,%p",string,string,&string);
    };
    NSLog(@"3.value = %@ : %p,%p",string,string,&string);
    string = @"222222";
    NSLog(@"4.value = %@ : %p,%p",string,string,&string);
    block();
    
    NSLog(@"\n");
}

- (void)test__BlockInt {
    __block int value = 5;
    NSLog(@"1.value = %d,%p",value,&value);
    void(^block)(void) = ^{
        NSLog(@"2.value = %d,%p",value,&value);
        value = 7;
        NSLog(@"3.value = %d,%p",value,&value);
    };
    NSLog(@"4.value = %d,%p",value,&value);
    value = 6;
    NSLog(@"5.value = %d,%p",value,&value);
    block();
    
    NSLog(@"\n");
}

- (void)test__BlockObject {
    __block NSString *string = @"111111";
    NSLog(@"1.value = %@ : %p,%p",string,string,&string);
    void(^block)(void) = ^{
        NSLog(@"2.value = %@ : %p,%p",string,string,&string);
        string = @"aaaaa";
        NSLog(@"2.1.value = %@ : %p,%p",string,string,&string);
    };
    NSLog(@"3.value = %@ : %p,%p",string,string,&string);
    string = @"222222";
    NSLog(@"4.value = %@ : %p,%p",string,string,&string);
    block();
    
    NSLog(@"\n");
}

@end
