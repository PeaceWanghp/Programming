//
//  OC_CrashController.m
//  Objective-C
//
//  Created by Peace on 12/6/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OC_CrashController.h"
#import "OC_CrashController+EXC_BAD_ACCESS.h"

@interface OC_CrashController ()
{
    NSRecursiveLock *_lock;
}
- (void)testSendToInstance;
+ (void)testSendToClass;
- (void)testCategoryProperty;

- (void)unsafe_unretained;
- (void)recursion;

- (void)arrayInsertNil;
- (void)dictionaryInsertNil;
- (void)setInsertNil;

@end

@implementation OC_CrashController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"EXC_BAD_ACCESS/错误地址访问"];
    [self.model appendDarkItemTitle:@"__unsafe_unretained" target:self selector:@selector(testBadAccess)];
    [self.model appendDarkItemTitle:@"recursion(死递归)" target:self selector:@selector(recursion)];
    [self.model appendDarkItemTitle:@"未实现的block" target:self selector:@selector(notBlock)];
    [self.model appendDarkItemTitle:@"未初始化" target:self selector:@selector(unInitialization)];
    
    [self.model appendOpenedHeader:@"EXC_BAD_INSTRUCTION/错误指令"];
    [self.model appendDarkItemTitle:@"Aync_Main_Queue" target:self selector:@selector(dispatchAyncMainQueue)];
    
    [self.model appendOpenedHeader:@"unrecognized"];
    [self.model appendDarkItemTitle:@"selector send to instance" target:self selector:@selector(testSendToInstance)];
    [self.model appendDarkItemTitle:@"selector send to class" target:self selector:@selector(testSendToClass)];
    [self.model appendDarkItemTitle:@"category property" target:self selector:@selector(testCategoryProperty)];
    
    [self.model appendOpenedHeader:@"错误操作"];
    [self.model appendDarkItemTitle:@"NSArray insert nil" target:self selector:@selector(arrayInsertNil)];
    [self.model appendDarkItemTitle:@"NSArray越界" target:self selector:@selector(arrayBeyond)];
    [self.model appendDarkItemTitle:@"NSArray遍历和操作" target:self selector:@selector(arrayEnumerateAndRemove)];
    [self.model appendDarkItemTitle:@"NSDictionary" target:self selector:@selector(dictionaryInsertNil)];
    [self.model appendDarkItemTitle:@"NSMapTable" target:self selector:@selector(mapTableInsertNil)];
    
    [self.model appendOpenedHeader:@"UI not on Main Thread"];
    [self.model appendDarkItemTitle:@"子线程绘制UI" target:self selector:@selector(uiNotMainThread)];
    
    [self.model appendOpenedHeader:@"Get Crash"];
    [self.model appendDarkItemTitle:@"zombi" target:self selector:@selector(testMethod)];
    [self.model appendDarkItemTitle:@"dealloc" target:self selector:@selector(testMethod)];
}

- (void)testMethod {
    
}

- (void)uiNotMainThread {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
    });
}

#pragma mark -
#pragma mark -- BadAccess
- (void)testBadAccess {
    [self badAccess];
}

@end
