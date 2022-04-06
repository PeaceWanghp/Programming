//
//  OCTaggedPointerController.m
//  Programming
//
//  Created by wangheping on 2022/2/10.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "OCTaggedPointerController.h"

#import <malloc/malloc.h>

#define HTLog(_var) \
{ \
    NSString *name = @#_var; \
    NSLog(@"%@: %p, %@, %lu", name, _var, [_var class], [_var retainCount]); \
}

@interface OCTaggedPointerController ()
@property (nonatomic,copy) NSString *name;
@end

@implementation OCTaggedPointerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"NSNumber："];
    [self.model appendDarkItemTitle:@"NSNumber" target:self selector:@selector(numberAction)];
    [self.model appendDarkItemTitle:@"NSNumber Type" target:self selector:@selector(numberTypeAction)];
    
    [self.model appendOpenedHeader:@"NSDate："];
    [self.model appendDarkItemTitle:@"NSDate" target:self selector:@selector(dateAction)];
    
    [self.model appendOpenedHeader:@"NSString："];
    [self.model appendDarkItemTitle:@"NSString" target:self selector:@selector(stringAction)];
    [self.model appendDarkItemTitle:@"NSString No Crash" target:self selector:@selector(stringNoCrashAction)];
    [self.model appendDarkItemTitle:@"NSString Crash" target:self selector:@selector(stringCrashAction)];
}

#pragma mark - NSNumber
- (void)numberTypeAction {
    NSNumber *number1 = @1;
    NSNumber *number2 = @2;
    NSNumber *number3 = @79;
    NSNumber *number4 = @(0xFFFFFFFFFFFFFFFF);
    
    NSLog(@"%p %p %p %p", number1, number2, number3, number4);
}
    
- (void)numberAction {
    NSNumber *number;
    {
        number = @1;
        [self log:number];
        
        number = [NSNumber numberWithInt:2];
        [self log:number];
        
        number = [NSNumber numberWithInteger:3];
        [self log:number];
        
        number = [NSNumber numberWithBool:YES];
        [self log:number];
        
        number = number.copy;
        [self log:number];
    }
    
    {
        NSNumber *number = [NSNumber numberWithInteger:4];
        [self log:number];
    }
    
    {
        NSInteger i = 0xFFFFFFFFFFFFFF;
        NSNumber *number = [NSNumber numberWithInteger:i];
        [self log:number];
    }
}

#pragma mark - NSString
- (void)stringAction
{
    NSString *a = @"a";                                             //a,         0x1025cd668, __NSCFConstantString
    NSString *c = [a copy];                                         //a,         0x1025cd668, __NSCFConstantString
    NSString *e = [NSString stringWithString:a];                    //a,         0x1025cd668, __NSCFConstantString
    
    NSMutableString *b = [a mutableCopy];                           //a,         0x280cbd290, __NSCFString
    
    NSString *d = [b copy];                                         //a,         0x800000000000308a, NSTaggedPointerString
    NSString *f = [NSString stringWithFormat:@"f"];                 //f,         0x800000000000330a, NSTaggedPointerString
    NSString *string1 = [NSString stringWithFormat:@"abcdefg"];     //abcdefg:   0xb3b332b231b130ba, NSTaggedPointerString
    NSString *string2 = [NSString stringWithFormat:@"abcdefghi"];   //abcdefghi: 0x8440714022d2a0ca, NSTaggedPointerString
    
    NSString *string3 = [NSString stringWithFormat:@"abcdefghij"];  //abcdefghij: 0x2802c9200, __NSCFString
    
    
    NSLog(@"\n");
    [self log:a];
    [self log:b];
    [self log:c];
    [self log:d];
    [self log:e];
    [self log:f];
    [self log:string1];
    [self log:string2];
    [self log:string3];
    NSLog(@"\n");
}

- (void)stringNoCrashAction {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abcdefghi"];
        });
    }
}

- (void)stringCrashAction {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abcdefghij"];
        });
    }
}

#pragma mark - NSDate
- (void)dateAction {
    
}

#pragma mark - Tools
- (void)log:(id)value {
    NSLog(@"%@: %p, %@, %@", value, value, [value class], [value valueForKey:@"retainCount"]);
}

@end
