//
//  OC_CrashController+EXC_BAD_ACCESS.m
//  Objective-C
//
//  Created by Peace on 1/10/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import "OC_CrashController+EXC_BAD_ACCESS.h"

@implementation OC_CrashController (EXC_BAD_ACCESS)

- (void)unsafe_unretained {
    NSArray * __unsafe_unretained _array = [[NSArray alloc] initWithObjects:@1,@2, nil];
    NSLog(@"%@",_array);
}

- (void)recursion {
    [self recursion];
}

- (void)notBlock {
    void(^blcok)(void);
    blcok();
}

- (void)unInitialization {
    UIView* view = [UIView alloc];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
}

@end
