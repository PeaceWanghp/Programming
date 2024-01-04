//
//  OC_CrashController.m
//  Objective-C
//
//  Created by Peace on 12/6/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OC_CrashController.h"

#import "BPWebViewController.h"
#import "OC_CrashObject.h"
#import "OC_CrashController+Unrecognized.h"

@interface OC_CrashController ()
{
    NSRecursiveLock *_lock;
}

@property (nonatomic, assign) OC_CrashObject *crashObject;
@property (nonatomic, assign) NSArray *array;

- (void)testSendToInstance;
+ (void)testSendToClass;

- (void)unsafe_unretained;

- (void)setInsertNil;

@end

@implementation OC_CrashController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Overview"];
    [self.model appendDarkItemTitle:@"*Exception Types" target:self selector:@selector(ExceptionTypesMethod)];
    [self.model appendDarkItemTitle:@"*EXC_BAD_ACCESS" target:self selector:@selector(EXC_BAD_ACCESS_Method)];
    [self.model appendDarkItemTitle:@"test method" target:self selector:@selector(testMethod)];
    
    [self.model appendOpenedHeader:@"*EXC_BAD_ACCESS"];
    //未实现的block
    [self.model appendDarkItemTitle:@"*EXC_BAD_ACCESS (SIGABRT)/KERN_INVALID_ADDRESS" target:self selector:@selector(exc_bad_access_KERN_INVALID_ADDRESS)];
    //试图解引用 NULL 指针
    [self.model appendDarkItemTitle:@"*EXC_BAD_ACCESS (SIGABRT)/KERN_INVALID_ADDRESS" target:self selector:@selector(exc_bad_access_KERN_INVALID_ADDRESS_1)];
    //infinite recursion(无限递归) stack-overflow
    [self.model appendDarkItemTitle:@"*EXC_BAD_ACCESS (SIGABRT)/KERN_PROTECTION_FAILURE" target:self selector:@selector(exc_bad_access_KERN_PROTECTION_FAILURE)];
    
    [self.model appendDarkItemTitle:@"__unsafe_unretained" target:self selector:@selector(testBadAccess)];
    [self.model appendDarkItemTitle:@"未初始化" target:self selector:@selector(unInitialization)];
    
    [self.model appendOpenedHeader:@"EXC_BAD_INSTRUCTION/错误指令"];
    [self.model appendDarkItemTitle:@"Aync_Main_Queue" target:self selector:@selector(dispatchAyncMainQueue)];
    
    [self.model appendOpenedHeader:@"*EXC_CRASH (SIGABRT)"];
    [self.model appendDarkItemTitle:@"*over range of array" target:self selector:@selector(exc_crash_sigabrt_overRange)];
    [self.model appendDarkItemTitle:@"*insert over range of array" target:self selector:@selector(exc_crash_sigabrt_insertOverRange)];
    [self.model appendDarkItemTitle:@"*insert over range of array1" target:self selector:@selector(exc_crash_sigabrt_insertOverRange1)];
    [self.model appendDarkItemTitle:@"*insert over range of dictionary" target:self selector:@selector(exc_crash_sigabrt_insertOverRange2)];
    [self.model appendDarkItemTitle:@"*abort()" target:self selector:@selector(exc_crash_sigkill_abort)];
    [self.model appendDarkItemTitle:@"*selector is nil" target:self selector:@selector(exc_crash_sigabrt_NonExistentMethod)];
    [self.model appendDarkItemTitle:@"*category property" target:self selector:@selector(exc_crash_sigabrt_categoryProperty)];
    
    
    [self.model appendOpenedHeader:@"*EXC_ARITHMETIC"];
    [self.model appendDarkItemTitle:@"exc_arithmetic_zero" target:self selector:@selector(exc_arithmetic_zero)];
    [self.model appendDarkItemTitle:@"exc_arithmetic_sqrt" target:self selector:@selector(exc_arithmetic_sqrt)];
    [self.model appendDarkItemTitle:@"exc_arithmetic_overflow" target:self selector:@selector(exc_arithmetic_overflow)];
    
    [self.model appendOpenedHeader:@"unrecognized"];
    [self.model appendDarkItemTitle:@"selector send to instance" target:self selector:@selector(testSendToInstance)];
    [self.model appendDarkItemTitle:@"selector send to class" target:self selector:@selector(testSendToClass)];
    [self.model appendDarkItemTitle:@"子线程绘制UI" target:self selector:@selector(uiNotMainThread)];
    
    [self.model appendOpenedHeader:@"Get Crash"];
    [self.model appendDarkItemTitle:@"zombi" target:self selector:@selector(testMethod)];
    [self.model appendDarkItemTitle:@"dealloc" target:self selector:@selector(testMethod)];
}

#pragma mark - Overview
- (void)ExceptionTypesMethod {
    BPWebViewController *webView = [BPWebViewController webViewController:[NSURL URLWithString:@"https://developer.apple.com/documentation/xcode/understanding-the-exception-types-in-a-crash-report"]];
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)EXC_BAD_ACCESS_Method {
    BPWebViewController *webView = [BPWebViewController webViewController:[NSURL URLWithString:@"https://developer.apple.com/documentation/xcode/investigating-memory-access-crashes"]];
    [self.navigationController pushViewController:webView animated:YES];
}

#pragma mark - Test

- (void)testMethod {
    __unsafe_unretained OC_CrashObject *unsafe_unretained_Object;
    @autoreleasepool {
        OC_CrashObject *object = [OC_CrashObject new];
        object.string = @"aaabbb";
        unsafe_unretained_Object = object;
    }
    NSLog(@"string = %@",unsafe_unretained_Object.string);
    
}

- (void)uiNotMainThread {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - EXC_BAD_ACCESS
- (void)exc_bad_access_KERN_INVALID_ADDRESS {
    void (^myBlock)(void) = nil;
    myBlock(); // 试图调用空的 Block
}

- (void)exc_bad_access_KERN_INVALID_ADDRESS_1 {
    int *ptr = NULL;
    int value = *ptr; // 试图解引用 NULL 指针
}

- (void)exc_bad_access_KERN_PROTECTION_FAILURE {
    while (YES) {
        [self testMethod];// 无限递归 stack-overflow
    }
}


#pragma mark - EXC_ARITHMETIC
/*
   // EXC_ARITHMETIC
   #define EXC_I386_DIV 1
   #define EXC_I386_INTO 2
   #define EXC_I386_NOEXT 3
   #define EXC_I386_EXTOVR 4
   #define EXC_I386_EXTERR 5
   #define EXC_I386_EMERR 6
   #define EXC_I386_BOUND 7
   #define EXC_I386_SSEEXTERR 8
 */
- (void)exc_arithmetic_zero {
    // 1. 除以零
    int result1 = 5 / 0;  // 这会导致 EXC_ARITHMETIC 异常
    NSLog(@"Result 1: %d", result1);
}

- (void)exc_arithmetic_sqrt {
    // 2. 对负数取平方根
    double negativeNumber = -4.0;
    double result2 = sqrt(negativeNumber);  // 这会导致 EXC_ARITHMETIC 异常

    NSLog(@"Result 2: %f", result2);
}

- (void)exc_arithmetic_overflow {
    // 3. 整数溢出
    int maxValue = INT_MAX;
    int overflow = maxValue + 1;  // 这会导致 EXC_ARITHMETIC 异常
    NSLog(@"Overflow: %d", overflow);
}

#pragma mark - EXC_CRASH (SIGABRT)
- (void)exc_crash_sigabrt_overRange {
    NSArray *array = @[@"a"];
    NSString *string = array[2];
}

- (void)exc_crash_sigabrt_insertOverRange {
    NSMutableArray *mutableArray = @[@"a"].mutableCopy;
    [mutableArray insertObject:@"b" atIndex:3];
}

- (void)exc_crash_sigabrt_insertOverRange1 {
    NSMutableArray *mutableArray = @[@"a"].mutableCopy;
    mutableArray[3] = @"c";
}

- (void)exc_crash_sigabrt_insertOverRange2 {
    NSMutableDictionary *mutableDictionary = @{}.mutableCopy;
    [mutableDictionary setObject:nil forKey:@"one_key"];
}

- (void)exc_crash_sigkill_abort {
    abort();
}

- (void)exc_crash_sigabrt_NonExistentMethod {
    [self performSelector:@selector(nonexistentMethod)]; // 调用不存在的方法
}

- (void)exc_crash_sigabrt_categoryProperty {
    self.categoryProperty = @"abc";//直接调用分类的属性导致[NSObject(NSObject) doesNotRecognizeSelector:]
}

#pragma mark -
#pragma mark -- BadAccess
- (void)testBadAccess {
    
}

- (void)arrayBeyond {
    NSArray *array = @[@1,@3,@4];
    NSNumber *number = array[3];
}

@end
