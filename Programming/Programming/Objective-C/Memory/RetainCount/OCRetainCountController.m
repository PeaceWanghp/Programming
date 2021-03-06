//
//  OCRetainCountController.m
//  Programming
//
//  Created by Peace on 7/15/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCRetainCountController.h"

#import "OCARCObject.h"
#import "OCMRCObject.h"

extern void _objc_autoreleasePoolPrint();

@interface OCRetainCountController ()
{
    OCARCObject *_subObject0;
}
@end

@implementation OCRetainCountController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //总结
    [self.model appendOpenedHeader:@"总结："];
    [self.model appendDarkItemTitle:@"1.对象支持使用 TaggedPointer：苹果会直接将对象的指针值作为引用计数返回。"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"2.非 TaggedPointer：如果当前设备是 64 位环境并且使用 Objective-C 2.0，那么会使用对象的 isa 指针的一部分空间（bits.extra_rc）来存储它的引用计数；"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"3.非 TaggedPointer：否则 Runtime 会使用一张 散列表（SideTables()）来管理引用计数。"
                             target:self selector:@selector(todo)];
    
    //ARC
    [self.model appendOpenedHeader:@"ARC"];
    [self.model appendDarkItemTitle:@"new/alloc/strong +1" target:self selector:@selector(testARC)];
    [self.model appendDarkItemTitle:@"copy/mutableCopy +1" target:self selector:@selector(testARC)];
    [self.model appendDarkItemTitle:@"指针超出作用域 -1" target:self selector:@selector(testARC)];
    [self.model appendDarkItemTitle:@"weak +0" target:self selector:@selector(arcWeak)];
    [self.model appendDarkItemTitle:@"autorelease pool -1" target:self selector:@selector(arcAutoreleasePool)];
    [self.model appendDarkItemTitle:@"weak autorelease" target:self selector:@selector(arcWeakAutorelease)];
    
    //MRC
    [self.model appendOpenedHeader:@"MRC"];
    [self.model appendDarkItemTitle:@"Release"
                             target:[OCMRCObject class] selector:@selector(selfRetain)];
    [self.model appendDarkItemTitle:@"Not Release"
                             target:[OCMRCObject class] selector:@selector(notSelfRetain)];
    [self.model appendDarkItemTitle:@"Autorelease"
                             target:[OCMRCObject class] selector:@selector(objectAutorelease)];
    
    //获取方式
    [self.model appendOpenedHeader:@"retainCount获取方式："];
    [self.model appendDarkItemTitle:@"[object valueForKey:@\"retainCount\"]" target:self selector:@selector(retainCount1)];
    [self.model appendDarkItemTitle:@"OBJC_EXTERN int _objc_rootRetainCount(id)" target:self selector:@selector(retainCount2)];
    [self.model appendDarkItemTitle:@"CFGetRetainCount((__bridge CFTypeRef)(object))" target:self selector:@selector(retainCount3)];
    
    OCARCObject *object = [OCARCObject new];
    object.tag = 111;
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:object];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark -
#pragma mark -- MRC


#pragma mark -
#pragma mark -- ARC
- (void)testARC {
    NSLog(@"0.-------------");
    _subObject0 = [[OCARCObject alloc] init];
    _subObject0.tag = 1001;
    NSLog(@"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)(_subObject0)));
    
    NSLog(@"1.-------------");
    OCARCObject * subObject = [[OCARCObject alloc] init];
    subObject.tag = 1;
    
    NSLog(@"2.-------------");
    OCARCObject * __strong subObject1 = [[OCARCObject alloc] init];
    subObject1.tag = 2;
    
    NSLog(@"3.-------------");
    {
        OCARCObject * subObject = [[OCARCObject alloc] init];
        subObject.tag = 3;
    }
    
    NSLog(@"4.-------------");
    OCARCObject * __strong subObject4 = [[OCARCObject alloc] init];
    subObject4.tag = 4;
    subObject4 = nil;
    
    NSLog(@"5.-------------");
    OCARCObject * __strong subObject5 = [OCARCObject new];
    subObject5.tag = 5;
    
    NSLog(@"end.-------------");
}

- (void)arcWeak {
    NSLog(@"5.-------------");
    //自己生成并持有对象
    OCARCObject * __strong object5 = [[OCARCObject alloc] init];
    object5.tag = 5;
    //object1持有弱引用
    __weak OCARCObject * object6 = object5;
    NSLog(@"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object5)));
    NSLog(@"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object6)));
    object5 = nil;
    NSLog(@"%@",[object5 valueForKey:@"retainCount"]);
    NSLog(@"%@",[object6 valueForKey:@"retainCount"]);
    
    NSLog(@"5.1.-------------");
    OCARCObject * __strong object7 = [[OCARCObject alloc] init];
    object7.tag = 7;
    __strong OCARCObject * object8 = object7;
    NSLog(@"5.1 : %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object7)));
    NSLog(@"5.1 : %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object8)));
    object7 = nil;
    NSLog(@"%@",[object7 valueForKey:@"retainCount"]);
    NSLog(@"%@",[object8 valueForKey:@"retainCount"]);
}

- (void)arcAutoreleasePool {
    NSLog(@"6.-------------");
    _objc_autoreleasePoolPrint();
    NSLog(@"6.1.-------------");
    @autoreleasepool {
        OCARCObject * __autoreleasing object = [[OCARCObject alloc] init];
        object.tag = 60;
        
        OCARCObject * __strong object1 = [[OCARCObject alloc] init];
        object1.tag = 61;
        
        OCARCObject * object2 = [[OCARCObject alloc] init];
        object2.tag = 62;
        
        _objc_autoreleasePoolPrint();
    }
    
    NSLog(@"7.-------------");
    _objc_autoreleasePoolPrint();
    NSLog(@"end.-------------");
}

- (void)arcWeakAutorelease {
    OCARCObject *strongObj = [OCARCObject new];
    strongObj.tag = 1;
    
    __autoreleasing OCARCObject *autoObj = [OCARCObject new];
    autoObj.tag = 2;
    
    NSLog(@"-----------");
    @autoreleasepool {
        __weak OCARCObject *weakObj = strongObj;
        weakObj.tag = 1;
    }
    NSLog(@"-----------");
    
    NSLog(@"++++++++++++");
    strongObj = nil;
    NSLog(@"++++++++++++");
}

#pragma mark -
#pragma mark -- Get RetainCount
//KVO
- (void)retainCount1 {
    NSObject *object = [NSObject new];
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
}

//私有方法
OBJC_EXTERN int _objc_rootRetainCount(id);
- (void)retainCount2 {
    NSObject *object = [NSObject new];
    NSLog(@"%d",_objc_rootRetainCount(object));
}

//CFGetRetainCount
- (void)retainCount3 {
    NSObject *object = [NSObject new];
    NSLog(@"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
}

@end
