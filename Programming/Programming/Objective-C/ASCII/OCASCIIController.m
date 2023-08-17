//
//  OCASCIIController.m
//  Programming
//
//  Created by heping wang on 2023/4/13.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "OCASCIIController.h"

@interface OCASCIIController ()

@end

@implementation OCASCIIController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"ASCII"];
    [self.model appendDarkItemTitle:@"assii to string" target:self selector:@selector(test1)];
    [self.model appendDarkItemTitle:@"xxx" target:self selector:@selector(test2)];
}

- (void)test1 {
    NSString *string = @"A";
    int asciiCode = [string characterAtIndex:0];
    NSLog(@"asciiCode = %d", asciiCode);
    
    string = [NSString stringWithFormat:@"%c",asciiCode];
    NSLog(@"string = %@", string);
    
    string = @"a";
    asciiCode = [string characterAtIndex:0];
    NSLog(@"asciiCode = %d", asciiCode);
    
    string = [NSString stringWithFormat:@"%c",asciiCode];
    NSLog(@"string = %@", string);
}

- (void)test2 {
    
}

@end
