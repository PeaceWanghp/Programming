//
//  main.m
//  Programming
//
//  Created by Peace on 6/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    NSLog(@"Test 1");
    NSLog(@"Test 2");
    NSLog(@"Test 3");
    NSLog(@"Test 4");
    NSLog(@"Test 5");
    NSLog(@"hello 1");
    NSLog(@"add programming 2 hello 1");
    NSLog(@"add programming 2 hello 2");
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
