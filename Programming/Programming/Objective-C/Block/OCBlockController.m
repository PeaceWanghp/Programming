//
//  OCBlockController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

typedef void(^PublicBlock)(void);

@interface OCBlockController ()
@property(nonatomic,copy) NSString *name;
@property(nonatomic,weak) PublicBlock publicBlock;
@end

@implementation OCBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.model appendDarkItemTitle:@"Property Block" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"GlobBlock（全局）" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"StatckBlock（栈）" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"Block（堆）" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"self in block" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"weakSelf in block" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"__block in block" target:self selector:@selector(todo)];
//    [self.model appendDarkItemTitle:@"non__block in block" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

- (void)intTest {
    NSLog(@"\n");
    int i = 10;//i为__block变量，可在block中重新赋值
    void (^blk)(void) = ^{
        NSLog(@"In block, i = %d", i);
    };
    i = 20;
    blk();//打印: In block, i = 20
    NSLog(@"i = %d", i);//打印：i = 20
    NSLog(@"\n");
}

- (void)blockIntTest {
    NSLog(@"\n");
    __block int i = 10;//i为__block变量，可在block中重新赋值
    void (^blk)(void) = ^{
        NSLog(@"In block, i = %d", i);
    };
    i = 20;
    blk();//打印: In block, i = 20
    NSLog(@"i = %d", i);//打印：i = 20
    NSLog(@"\n");
}

- (void)blockSelfTest {
    NSLog(@"\n");
    self.name = @"test 1";
    NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    
    void (^ block)(void) = ^{
        NSLog(@"name = %@",self.name);
        self.name = @"test 2";
        NSLog(@"name = %@",self.name);
        NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    };
    self.name = @"test 3";
    NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    block();
    NSLog(@"%@",[block class]);
    NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    NSLog(@"name = %@",self.name);
    NSLog(@"\n");
}

void (^blk)(void) = ^{
    NSLog(@"Global Block");
};

- (void)blockType {
    NSLog(@"\n");
    
    NSLog(@"%@",[blk class]);
    
    void (^ block)(void) = ^{
    };
    NSLog(@"%@",[block class]);
    
    int i = 0;
    void (^ block1)(void) = ^{
        NSLog(@"%d",i);
    };
    NSLog(@"%@",[block1 class]);
    
    int count = 0;
    NSLog(@"%@", [^{NSLog(@"Stack Block:%d",count);} class]);
    
    NSLog(@"\n");
}

- (void)blockWeakSelf {
    NSLog(@"\n");
    
    NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    __weak typeof(self) weakSelf = self;
    self.publicBlock = ^{
        weakSelf.name = @"xxxxxx";
        NSLog(@"self retain count = %@",[weakSelf valueForKey:@"retainCount"]);
//        self.name = @"ooo";
    };
    NSLog(@"block retainCount = %@",[self.publicBlock valueForKey:@"retainCount"]);
    self.publicBlock();
    NSLog(@"block retainCount = %@",[self.publicBlock valueForKey:@"retainCount"]);
    NSLog(@"self retain count = %@",[self valueForKey:@"retainCount"]);
    
    NSLog(@"\n");
}

- (void)blockGloab {
    NSLog(@"\n");
    
    void (^ block1)(void) = ^{
//        NSLog(@"2.block retainCount = %@",[block1 valueForKey:@"retainCount"]);
    };
    
    dispatch_async(dispatch_queue_create("xxx", 0), ^{
        self.name = @"cccc";
    });
    
    NSLog(@"1.block retainCount = %@",[block1 valueForKey:@"retainCount"]);
    block1();
    NSLog(@"3.block retainCount = %@",[block1 valueForKey:@"retainCount"]);
    NSLog(@"\n");
}

@end
