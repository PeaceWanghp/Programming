//
//  OCBlockController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

@interface OCBlockController ()
{
    void(^_classBlock)(void);
}
@property(nonatomic,weak) void(^weakBlock)(void);
@property(nonatomic,strong) void(^strongBlock)(void);
@property(nonatomic,copy) void(^copyBlock)(void);
@end

@implementation OCBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"结论："];
    [self.model appendDarkItemTitle:@"被strong的block:使用了堆区数据则为mallocBlock,未使用则globalBlock" target:self selector:nil];
    [self.model appendDarkItemTitle:@"未被strong的block:使用了堆区数据则为stackBlock,未使用则globalBlock" target:self selector:nil];
    
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

#pragma mark -
#pragma mark -- 全局
void(^block)(void) = ^{
    
};

static int svalue = 1;
void(^sBlock)(void) = ^{
    NSLog(@"svalue = %d",svalue);
};

int value = 1;
void(^intBlock)(void) = ^{
    NSLog(@"value = %d",value);
};

//NSObject *obj = [NSObject new];
//void(^selfBlock)(void) = ^{
//    NSLog(@"obj = %@",obj);
//};

- (void)globalAction {
    block();
    intBlock();
    sBlock();
    NSLog(@"block = %@",block);
    NSLog(@"intBlock = %@",intBlock);
    NSLog(@"sBlock = %@",sBlock);
}

#pragma mark -
#pragma mark -- 返回值
- (void)returnValueAction {
    void(^block)(id) = [self testReturnBlock];
    block(self);
    NSLog(@"block = %@",block);
    
    void(^copyBlock)(id) = [block copy];
    NSLog(@"copyBlock = %@",copyBlock);
    
    void(^block1)(id) = [self testReturnBlock2];
    block1(self);
    NSLog(@"block1 = %@",block1);
}

- (void(^)(id obj))testReturnBlock {
    void(^block)(id) = ^(id obj) {
        NSLog(@"obj = %@",obj);
        NSLog(@"self = %@",self);
    };
    NSLog(@"__block = %@",block);
    return block;
}

- (void(^)(id obj))testReturnBlock2 {
    void(^block)(id) = ^(id obj) {
        NSLog(@"obj = %@",obj);
    };
    NSLog(@"__block = %@",block);
    return block;
}

#pragma mark -
#pragma mark -- 方法参数
- (void)copyArgumentAction {
    //-----------__NSGlobalBlock__------------
     [self testCopyBlock:^{
         
     }];
    
    static int sValue = 1;
    [self testCopyBlock:^{
        NSLog(@"sValue = %d",sValue);
    }];
    
    const int cValue = 1;
    [self testCopyBlock:^{
        NSLog(@"cValue = %d",cValue);
    }];
    
    //------------__NSMallocBlock__-----------
    int value = 1;
    [self testCopyBlock:^{
        NSLog(@"value = %d",value);
    }];
    
    __block int blockValue = 1;
    [self testCopyBlock:^{
        blockValue = 2;
        NSLog(@"cValue = %d",blockValue);
    }];
    
    NSString *string = @"1111";
    [self testCopyBlock:^{
        NSLog(@"string = %@",string);
    }];
    
    __block NSString *blockString = @"2222";
    [self testCopyBlock:^{
        blockString = @"33333";
        NSLog(@"blockString = %@",blockString);
    }];
    
    [self testCopyBlock:^{
        NSLog(@"self = %@",self);
    }];
    
    __weak typeof(self) weakSelf = self;
    [self testCopyBlock:^{
        NSLog(@"weakSelf = %@",weakSelf);
    }];
}

- (void)testCopyBlock:(void(^)(void))block {
    void(^copyBlock)(void) = [block copy];
    copyBlock();
    NSLog(@"copyBlock = %@",copyBlock);
}

- (void)argumentAction {
    //------------__NSGlobalBlock__-------------
    [self testBlock:^{
        
    }];
    
    static int sValue = 1;
    [self testBlock:^{
        NSLog(@"sValue = %d",sValue);
    }];
    
    const int cValue = 1;
    [self testBlock:^{
        NSLog(@"cValue = %d",cValue);
    }];
    
    //------------__NSStackBlock__-------------
    int value = 1;
    [self testBlock:^{
        NSLog(@"value = %d",value);
    }];
    
    __block int blockValue = 1;
    [self testBlock:^{
        blockValue = 2;
        NSLog(@"cValue = %d",blockValue);
    }];
    
    NSString *string = @"1111";
    [self testBlock:^{
        NSLog(@"string = %@",string);
    }];
    
    __block NSString *blockString = @"2222";
    [self testBlock:^{
        blockString = @"33333";
        NSLog(@"blockString = %@",blockString);
    }];
    
    [self testBlock:^{
        NSLog(@"self = %@",self);
    }];
    
    __weak typeof(self) weakSelf = self;
    [self testBlock:^{
        NSLog(@"weakSelf = %@",weakSelf);
    }];
}

- (void)testBlock:(void(^)(void))block {
    block();
    NSLog(@"block = %@",block);
}

#pragma mark -
#pragma mark -- 属性block
- (void)copyBlockAction {
    //------------__NSGlobalBlock__-------------
    //
    _copyBlock = ^ {
        
    };
    _copyBlock();
    NSLog(@"block1 = %@",_copyBlock);
    
    //copy block
    _copyBlock = [_copyBlock copy];
    _copyBlock();
    NSLog(@"block2 = %@",_copyBlock);
    
    //static
    static int sValue = 1;
    _copyBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    _copyBlock();
    NSLog(@"block4 = %@",_copyBlock);
    
    //const
    const int cValue = 1;
    _copyBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    _copyBlock();
    NSLog(@"block5 = %@",_copyBlock);
    
    //------------__NSMallocBlock__-------------
    //
    int value = 1;
    _copyBlock = ^ {
        NSLog(@"value = %d",value);
    };
    _copyBlock();
    NSLog(@"block3 = %@",_copyBlock);
    
    //__block
    __block int blockValue = 1;
    _copyBlock = ^ {
        blockValue = 2;
    };
    _copyBlock();
    NSLog(@"block6 = %@",_copyBlock);
    
    //
    NSString *string = @"11111";
    _copyBlock = ^ {
        NSLog(@"string = %@",string);
    };
    _copyBlock();
    NSLog(@"block7 = %@",_copyBlock);
    
    //
    __block NSString *blockString = @"22222";
    _copyBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    _copyBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block8 = %@",_copyBlock);
    
    //
    _copyBlock = ^ {
        NSLog(@"self = %@",self);
    };
    _copyBlock();
    NSLog(@"block9 = %@",_copyBlock);
}

- (void)strongBlockAction {
    //---------__NSGlobalBlock__-----------
    //
    _strongBlock = ^ {
        
    };
    _strongBlock();
    NSLog(@"block1 = %@",_strongBlock);
    
    //copy block
    _strongBlock = [_strongBlock copy];
    _strongBlock();
    NSLog(@"block2 = %@",_strongBlock);
    
    //static
    static int sValue = 1;
    _strongBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    _strongBlock();
    NSLog(@"block4 = %@",_strongBlock);
    
    //const
    const int cValue = 1;
    _strongBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    _strongBlock();
    NSLog(@"block5 = %@",_strongBlock);
    
    //---------__NSMallocBlock__-----------
    //
    int value = 1;
    _strongBlock = ^ {
        NSLog(@"value = %d",value);
    };
    _strongBlock();
    NSLog(@"block3 = %@",_strongBlock);
    
    //__block
    __block int blockValue = 1;
    _strongBlock = ^ {
        blockValue = 2;
    };
    _strongBlock();
    NSLog(@"block6 = %@",_strongBlock);
    
    //
    NSString *string = @"11111";
    _strongBlock = ^ {
        NSLog(@"string = %@",string);
    };
    _strongBlock();
    NSLog(@"block7 = %@",_strongBlock);
    
    //
    __block NSString *blockString = @"22222";
    _strongBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    _strongBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block8 = %@",_strongBlock);
    
    //
    _strongBlock = ^ {
        NSLog(@"self = %@",self);
    };
    _strongBlock();
    NSLog(@"block9 = %@",_strongBlock);
}

- (void)weakBlockAction {
    //----------__NSGlobalBlock__-----------
    //
    _weakBlock = ^ {
        
    };
    _weakBlock();
    NSLog(@"weakBlock = %@",_weakBlock);
    
    //copy block
    _weakBlock = [_weakBlock copy];
    _weakBlock();
    NSLog(@"copyWeakBlock = %@",_weakBlock);
    
    //static
    static int sValue = 1;
    _weakBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    _weakBlock();
    NSLog(@"sblock = %@",_weakBlock);
    
    //const
    const int cValue = 1;
    _weakBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    _weakBlock();
    NSLog(@"sblock = %@",_weakBlock);
    
    //------------__NSStackBlock__------------
    //
    int value = 1;
    _weakBlock = ^ {
        NSLog(@"value = %d",value);
    };
    _weakBlock();
    NSLog(@"block1 = %@",_weakBlock);
    
    //__block
    __block int blockValue = 1;
    _weakBlock = ^ {
        blockValue = 2;
    };
    _weakBlock();
    NSLog(@"block2 = %@",_weakBlock);
    
    //
    NSString *string = @"11111";
    _weakBlock = ^ {
        NSLog(@"string = %@",string);
    };
    _weakBlock();
    NSLog(@"block3 = %@",_weakBlock);
    
    //
    __block NSString *blockString = @"22222";
    _weakBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    _weakBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block4 = %@",_weakBlock);
    
    //
    _weakBlock = ^ {
        NSLog(@"self = %@",self);
    };
    _weakBlock();
    NSLog(@"block5 = %@",_weakBlock);
}

#pragma mark -
#pragma mark -- 局部block变量
- (void)localBlock {
    //------------__NSGlobalBlock__----------
    //
    void(^block)(void) = ^ {
        
    };
    block();
    NSLog(@"block = %@",block);
    
    //copy block
    void(^copyBlock)(void) = [block copy];
    copyBlock();
    NSLog(@"copyBlock = %@",copyBlock);
    
    //static
    static int sValue = 1;
    void(^sblock)(void) = ^ {
        NSLog(@"value = %d",sValue);
    };
    sblock();
    NSLog(@"sblock = %@",sblock);
    
    //const
    const int cValue = 1;
    void(^cblock)(void) = ^ {
        NSLog(@"value = %d",cValue);
    };
    cblock();
    NSLog(@"sblock = %@",cblock);
    
    //------------__NSMallocBlock__----------
    //
    int value = 1;
    void(^block1)(void) = ^ {
        NSLog(@"value = %d",value);
    };
    block1();
    NSLog(@"block1 = %@",block1);
    
    //__block
    __block int blockValue = 1;
    void(^block2)(void) = ^ {
        blockValue = 2;
    };
    block2();
    NSLog(@"block2 = %@",block2);
    
    //
    NSString *string = @"11111";
    void(^block3)(void) = ^ {
        NSLog(@"string = %@",string);
    };
    block3();
    NSLog(@"block3 = %@",block3);
    
    //
    __block NSString *blockString = @"22222";
    void(^block4)(void) = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    block4();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block4 = %@",block4);
    
    //
    void(^block5)(void) = ^ {
        NSLog(@"self = %@",self);
    };
    block5();
    NSLog(@"block5 = %@",block5);
}

#pragma mark -
#pragma mark -- 类block变量
- (void)classBlock {
    //----------__NSGlobalBlock__---------
    //
    _classBlock = ^ {
        
    };
    _classBlock();
    NSLog(@"block = %@",_classBlock);
    
    //copy block
    _classBlock = [_classBlock copy];
    _classBlock();
    NSLog(@"copyBlock = %@",_classBlock);
    
    //static
    static int sValue = 1;
    _classBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    _classBlock();
    NSLog(@"sblock = %@",_classBlock);
    
    //const
    const int cValue = 1;
    _classBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    _classBlock();
    NSLog(@"sblock = %@",_classBlock);
    
    //----------__NSMallocBlock__---------
    //
    int value = 1;
    _classBlock = ^ {
        NSLog(@"value = %d",value);
    };
    _classBlock();
    NSLog(@"block1 = %@",_classBlock);
    
    //__block
    __block int blockValue = 1;
    _classBlock = ^ {
        blockValue = 2;
    };
    _classBlock();
    NSLog(@"block2 = %@",_classBlock);
    
    //
    NSString *string = @"11111";
    _classBlock = ^ {
        NSLog(@"string = %@",string);
    };
    _classBlock();
    NSLog(@"block3 = %@",_classBlock);
    
    //
    __block NSString *blockString = @"22222";
    _classBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    _classBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block4 = %@",_classBlock);
    
    //
    _classBlock = ^ {
        NSLog(@"self = %@",self);
    };
    _classBlock();
    NSLog(@"block5 = %@",_classBlock);
    
    //
    __weak typeof(self) weakSelf = self;
    _classBlock = ^ {
        NSLog(@"weakSelf = %@",weakSelf);
    };
    _classBlock();
    NSLog(@"block5 = %@",_classBlock);
}

@end

