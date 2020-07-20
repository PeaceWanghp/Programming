//
//  OC_CrashController+EXC_BAD_ACCESS.m
//  Objective-C
//
//  Created by Peace on 1/10/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import "OC_CrashController+EXC_BAD_ACCESS.h"

@interface OCPPerson : NSObject
@property (nonatomic,weak) NSString *object;
@property (nonatomic,copy) NSString *object1;
@property (nonatomic,unsafe_unretained) NSString *object2;
- (void)todo;
@end

@implementation OCPPerson

- (void)todo {
    NSLog(@"%@",_object);
    NSLog(@"%@",_object1);
    NSLog(@"%@",_object2);
}

@end

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

- (void)badAccess {
    OCPPerson *person = [OCPPerson new];
    {
        NSString *string = [[NSMutableString alloc] initWithString:@"111"];
        person.object = string;
        NSString *string1 = [[NSMutableString alloc] initWithString:@"222"];
        person.object1 = string1;
        NSString *string2 = [[NSMutableString alloc] initWithString:@"333"];
        person.object2 = string2;
    }
    [person todo];
}

@end
