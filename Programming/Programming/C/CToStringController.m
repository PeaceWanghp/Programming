//
//  CToStringController.m
//  Programming
//
//  Created by heping wang on 2023/3/21.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CToStringController.h"

@interface CToStringController ()

@end

@implementation CToStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self didAction];
}

- (void)didAction {
    //char -> NSString
    char *charStr = "hello";
    NSString *ocStr = [NSString stringWithCString:charStr encoding:NSUTF8StringEncoding];
    NSLog(@"%s---%@",charStr,ocStr);

    //NSString ->char
    NSString *ocString  = @"HELLO";
    const char *charString = NULL;
    if ([ocString canBeConvertedToEncoding:NSUTF8StringEncoding]) {
        charString = [ocString cStringUsingEncoding:NSUTF8StringEncoding];
    }
    NSLog(@"%@===%s",ocString,charString);
    
    NSLog(@"test1 = %d, test2 = %d",[self test1],[self test2]);
}

- (int)test1 {
    int a = 1;
    return a ++;
}

- (int)test2 {
    int a = 1;
    return ++a;
}

@end
