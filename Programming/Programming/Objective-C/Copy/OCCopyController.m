//
//  OCCopyController.m
//  Programming
//
//  Created by Peace on 7/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCCopyController.h"

#import "OCCopyObject.h"

@interface OCCopyController ()

@end

@implementation OCCopyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"NString copy" target:self selector:@selector(copyString)];
    [self.model appendDarkItemTitle:@"NString mutableCopy" target:self selector:@selector(copyMutableString)];
    
    [self.model appendDarkItemTitle:@"Object shallowCopy (浅拷贝)" target:self selector:@selector(shallowCopyObject)];
    [self.model appendDarkItemTitle:@"Object deepCopy (深拷贝)" target:self selector:@selector(deepCopyObject)];
    
    [self.model appendDarkItemTitle:@"NSArray copy" target:self selector:@selector(copyArray)];
    [self.model appendDarkItemTitle:@"NSArray mutablCopy" target:self selector:@selector(mutableCopyArray)];
    [self.model appendDarkItemTitle:@"NSArray copyItmes" target:self selector:@selector(copyItmes)];
}

- (void)todo {
    
}

#pragma mark -
#pragma mark -- NSString
- (void)copyString {
    //NSString
    NSString *string = @"stringCopy";
    NSString *copyString = [string copy];
    NSLog(@"1. [%@:%p] copy [%@:%p]",[string class], string, [copyString class], copyString);
    
    //NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutableStringCopy"];
    NSString *copyMutableString = [mutableString copy];
    NSLog(@"2. [%@: %p] copy [%@ : %p]",[mutableString class], mutableString,
                                    [copyMutableString class], copyMutableString);
}

- (void)copyMutableString {
    //NSString
    NSString *string = @"stringCopy";
    NSString *copyString = [string mutableCopy];
    NSLog(@"3. [%@:%p] copy [%@:%p]",[string class], string, [copyString class], copyString);
    
    //NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutableStringCopy"];
    NSMutableString *mutableCopyMutableString = [mutableString mutableCopy];
    NSLog(@"4. [%@: %p] mutableCopy [%@ : %p]",[mutableString class], mutableString,
                                    [mutableCopyMutableString class], mutableCopyMutableString);
}

#pragma mark -
#pragma mark -- Object
- (void)shallowCopyObject {
    OCCopyObject *object = [[OCCopyObject alloc] init];
    object.name = @"wow";
    
    //浅拷贝
    OCCopyObject *copyObject = [object copy];
    
    NSLog(@"[%@: %p] copy [%@ : %p]",[object class], object, [copyObject class], copyObject);
    
    NSLog(@"retainCount = %@ : %@",[object valueForKey:@"retainCount"],[copyObject valueForKey:@"retainCount"]);
}

- (void)deepCopyObject {
    OCCopyObject *object = [[OCCopyObject alloc] init];
    object.name = @"wow";
    
    //深拷贝
    OCCopyObject *mutableCopyObject = [object mutableCopy];
    
    NSLog(@"[%@: %p] copy [%@ : %p]",[object class], object, [mutableCopyObject class], mutableCopyObject);
    
    NSLog(@"retainCount = %@ : %@",[mutableCopyObject valueForKey:@"retainCount"],
                                [object valueForKey:@"retainCount"]);
}

#pragma mark -
#pragma mark -- NSArray
- (void)copyArray {
    NSArray *array = @[@"a",@"b",@"c"];
    NSArray *copyArray = [array copy];
    [self printArray:array array:copyArray];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSMutableArray *copyMutableArray = [mutableArray copy];
    [self printArray:mutableArray array:copyMutableArray];
}

- (void)mutableCopyArray {
    NSArray *array = @[@"a",@"b",@"c"];
    NSArray *copyArray = [array mutableCopy];
    [self printArray:array array:copyArray];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSMutableArray *copyMutableArray = [mutableArray mutableCopy];
    [self printArray:mutableArray array:copyMutableArray];
}

- (void)copyItmes {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSArray *copyArray = [[NSArray alloc] initWithArray:mutableArray copyItems:YES];
    
    [self printArray:mutableArray array:copyArray];
}

- (void)printArray:(NSArray *)array array:(NSArray *)array2 {
    NSLog(@"=======%p,%p",array,array2);
    for (int i = 0; i < 3; i ++) {
        NSString *string = [array objectAtIndex:i];
        NSString *string2 = [array2 objectAtIndex:i];
        NSLog(@"%p,%p",string,string2);
    }
}

@end
