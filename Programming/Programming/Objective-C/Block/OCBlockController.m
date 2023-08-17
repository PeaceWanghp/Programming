//
//  OCBlockController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

#import "OCBlockWeakStrongVController.h"

@interface OCBlockController ()

@end

@implementation OCBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"测试"];
    [self.model appendDarkItemTitle:@"ARC Strong一个statckBlock" target:self selector:@selector(testBlock)];
    [self.model appendDarkItemTitle:@"mrc Strong一个statckBlock" target:self selector:@selector(globalAction)];
    [self.model appendDarkItemWithTitle:@"解循环引用" class:NSClassFromString(@"OCBlockTestTableViewController")];
    
    [self.model appendOpenedHeader:@"概述："];
    [self.model appendDarkItemTitle:@"SourceCode(源码)" target:self selector:@selector(globalAction)];
    [self.model appendDarkItemTitle:@"被strong的block:使用了堆区数据则为mallocBlock,未使用则globalBlock" target:self selector:nil];
    [self.model appendDarkItemTitle:@"未被strong的block:使用了堆区数据则为stackBlock,未使用则globalBlock" target:self selector:nil];
    
    [self.model appendDarkItemTitle:@"Recursion block"
                             target:self
                           selector:@selector(testBlockRecursion)];
    
    [self.model appendOpenedHeader:@"使用："];
    [self.model appendDarkItemTitle:@"定义/实现1：\nvoid (^block)(void) = ^ {\n \n};"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"定义/实现2：\nint (^block)(float val) = ^int(float val) {\n \n};"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"作为变量：\nvoid (^block)(void) = ^{\n \n};\nblock();"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"作为参数：\n- (void)xxx:(BOOL(^)(NSString *))block {\n    block(@\"hi\");\n}\n[self xxx:^BOOL(NSString *value) {\n    return YES;\n}];"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"作为返回值：\n- (void(^)(id obj))xxx {\n    return ^(id obj) {\n \n    };\n}\nvoid(^block)(id) = [self xxx];\nblock(@\"hi\");"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"作为属性1：\n@property(copy) void(^copyBlock)(void);\nself.copyBlock = ^ {\n \n};\nself.copyBlock();"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemTitle:@"作为属性2：\ntypedef void(^TypedefBlock)(void);\n@property(copy) TypedefBlock typedefBlock;\nself.typedefBlock = ^ {\n \n};\nself.typedefBlock();"
                             target:nil
                           selector:nil];
    [self.model appendDarkItemWithTitle:@"Weak/Strong Self" class:[OCBlockWeakStrongVController class]];
    [self.model appendDarkItemTitle:@"不增加循环引用" target:self selector:@selector(testNoRetain)];
    
    [self.model appendOpenedHeader:@"!__block"];
    [self.model appendDarkItemTitle:@"self" target:self selector:@selector(testSelf)];
    [self.model appendDarkItemTitle:@"int" target:self selector:@selector(testInt)];
    [self.model appendDarkItemTitle:@"NSObject" target:self selector:@selector(testObject)];
    
    [self.model appendOpenedHeader:@"__block"];
    [self.model appendDarkItemTitle:@"int" target:self selector:@selector(test__BlockInt)];
    [self.model appendDarkItemTitle:@"NSObject" target:self selector:@selector(test__BlockObject)];
    
    [self.model appendOpenedHeader:@"Global(全局block)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(globalAction)];
    
    [self.model appendOpenedHeader:@"LocalBlock(局部block)"];
    [self.model appendDarkItemTitle:@"Method" target:self selector:@selector(localBlock)];
    [self.model appendDarkItemTitle:@"Class" target:self selector:@selector(classBlock)];
    
    [self.model appendOpenedHeader:@"PropertyBlock(属性block)"];
    [self.model appendDarkItemTitle:@"WeakBlock" target:self selector:@selector(weakBlockAction)];
    [self.model appendDarkItemTitle:@"StrongBlock" target:self selector:@selector(strongBlockAction)];
    [self.model appendDarkItemTitle:@"CopyBlock" target:self selector:@selector(copyBlockAction)];
    
    [self.model appendOpenedHeader:@"Method Argument(方法参数)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(argumentAction)];
    [self.model appendDarkItemTitle:@"Copy Action" target:self selector:@selector(copyArgumentAction)];
    
    [self.model appendOpenedHeader:@"Method Return(方法返回值)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(returnValueAction)];
}

- (void)dealloc {
    
}

- (void)testNoRetain {
    {
        NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
        
        __weak typeof(self) weakSelf = self;
        void (^block)(void) = ^(void){
            NSLog(@"11.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakSelf)));
            weakSelf.view.backgroundColor = [UIColor redColor];
        };
        block();
        
        NSLog(@"2.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
    }
    NSLog(@"3.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
    NSLog(@"\n\n");
    {
        NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
        
        typeof(self) *object = &self;
        void (^block)(void) = ^(void){
            
            NSLog(@"11.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(*object)));
//            id *object = blockController;
            OCBlockController *blockController = *object;
            blockController.view.backgroundColor = [UIColor redColor];
        };
        block();
        
        NSLog(@"2.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
    }
    NSLog(@"3.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(self)));
}

- (void)xxx:(BOOL(^)(NSString *))block {
    
}

- (void)testBlock {
    int age = 1;
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };

    void (^block2)(void) = ^{
        NSLog(@"block2:%d",age);
    };

    NSLog(@"%@/%@/%@",[block1 class],[block2 class],[^{
        NSLog(@"block3:%d",age);
    } class]);
}

- (void)searchFiles {
    [self pathsWithEachSubpathsForPath:nil filterBlock:^BOOL(NSString *xx) {
        return YES;
    }];
    NSLog(@"%@",[self pathsWithEachSubpathsForPath:@"root" filterBlock:^BOOL(NSString *path){
        return NO;
    }]);
}

- (NSArray *)pathsWithEachSubpathsForPath:(NSString *)path filterBlock:(BOOL(^)(NSString *))filter {
    
    return nil;
}

- (void)testBlockRecursion {
    __block int a = 0;
    int (^aBlock)(int) = ^(int num) {
        a += num;
        if (a < 5) {
            aBlock(a);
        }
        return a++;
    };
    NSLog(@"value = %d", aBlock(1));
}

@end
