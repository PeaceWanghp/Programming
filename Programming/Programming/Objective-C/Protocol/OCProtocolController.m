//
//  OCProtocolController.m
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCProtocolController.h"
#import "OCTestProtocol.h"

@interface OCProtocolController ()<OCTestDelegate,OCTestInterDelegate>
{
    int _value;
    int _value2;
}
@end

@implementation OCProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _value = 13;
    _value2 = 15;
    
    [self.model appendOpenedHeader:@"作用："];
    [self.model appendDarkItemTitle:@"测试1" target:self selector:@selector(testAction)];
    [self.model appendDarkItemTitle:@"测试2" target:self selector:@selector(test2Action)];
    
    [self.model appendOpenedHeader:@"Protocol 和 继承 区别："];
    [self.model appendDarkItemTitle:@"继承之后默认就有实现，而protocol只要声明没有实现" target:self selector:@selector(testAction)];
    [self.model appendDarkItemTitle:@"相同类型的类可以使用继承，但是不同类型的类只能使用protocol" target:self selector:@selector(test2Action)];
    [self.model appendDarkItemTitle:@"某些场景下与多态概念类似" target:self selector:@selector(test2Action)];
}

#pragma mark -
#pragma mark -- Custom
- (void)testAction {
    OCTestProtocol *testProtocol = [[OCTestProtocol alloc] init];
    testProtocol.delegate = self;
    [testProtocol testAction];
}

- (void)test2Action {
    OCTestProtocol *testProtocol = [[OCTestProtocol alloc] init];
    testProtocol.interDelegate = self;
    [testProtocol test2Action];
}

#pragma mark -
#pragma mark -- Delegate
- (int)testProtocol {
    return _value;
}

- (int)testInterProtocol {
    return _value2;
}

@end
