//
//  OCBlockController+Type.m
//  Programming
//
//  Created by Peace on 9/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController+Type.h"

@implementation OCBlockController (Type)

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
    self.copyBlock = ^ {
        
    };
    self.copyBlock();
    NSLog(@"block1 = %@",self.copyBlock);
    
    //copy block
    self.copyBlock = [self.copyBlock copy];
    self.copyBlock();
    NSLog(@"block2 = %@",self.copyBlock);
    
    //static
    static int sValue = 1;
    self.copyBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    self.copyBlock();
    NSLog(@"block4 = %@",self.copyBlock);
    
    //const
    const int cValue = 1;
    self.copyBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    self.copyBlock();
    NSLog(@"block5 = %@",self.copyBlock);
    
    //------------__NSMallocBlock__-------------
    //
    int value = 1;
    self.copyBlock = ^ {
        NSLog(@"value = %d",value);
    };
    self.copyBlock();
    NSLog(@"block3 = %@",self.copyBlock);
    
    //__block
    __block int blockValue = 1;
    self.copyBlock = ^ {
        blockValue = 2;
    };
    self.copyBlock();
    NSLog(@"block6 = %@",self.copyBlock);
    
    //
    NSString *string = @"11111";
    self.copyBlock = ^ {
        NSLog(@"string = %@",string);
    };
    self.copyBlock();
    NSLog(@"block7 = %@",self.copyBlock);
    
    //
    __block NSString *blockString = @"22222";
    self.copyBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    self.copyBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block8 = %@",self.copyBlock);
    
    //
    self.copyBlock = ^ {
        NSLog(@"self = %@",self);
    };
    self.copyBlock();
    NSLog(@"block9 = %@",self.copyBlock);
}

- (void)strongBlockAction {
    //---------__NSGlobalBlock__-----------
    //
    self.strongBlock = ^ {
        
    };
    self.strongBlock();
    NSLog(@"block1 = %@",self.strongBlock);
    
    //copy block
    self.strongBlock = [self.strongBlock copy];
    self.strongBlock();
    NSLog(@"block2 = %@",self.strongBlock);
    
    //static
    static int sValue = 1;
    self.strongBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    self.strongBlock();
    NSLog(@"block4 = %@",self.strongBlock);
    
    //const
    const int cValue = 1;
    self.strongBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    self.strongBlock();
    NSLog(@"block5 = %@",self.strongBlock);
    
    //---------__NSMallocBlock__-----------
    //
    int value = 1;
    self.strongBlock = ^ {
        NSLog(@"value = %d",value);
    };
    self.strongBlock();
    NSLog(@"block3 = %@",self.strongBlock);
    
    //__block
    __block int blockValue = 1;
    self.strongBlock = ^ {
        blockValue = 2;
    };
    self.strongBlock();
    NSLog(@"block6 = %@",self.strongBlock);
    
    //
    NSString *string = @"11111";
    self.strongBlock = ^ {
        NSLog(@"string = %@",string);
    };
    self.strongBlock();
    NSLog(@"block7 = %@",self.strongBlock);
    
    //
    __block NSString *blockString = @"22222";
    self.strongBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    self.strongBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block8 = %@",self.strongBlock);
    
    //
    self.strongBlock = ^ {
        NSLog(@"self = %@",self);
    };
    self.strongBlock();
    NSLog(@"block9 = %@",self.strongBlock);
}

- (void)weakBlockAction {
    //----------__NSGlobalBlock__-----------
    //
    self.weakBlock = ^ {
        
    };
    self.weakBlock();
    NSLog(@"weakBlock = %@",self.weakBlock);
    
    //copy block
    self.weakBlock = [self.weakBlock copy];
    self.weakBlock();
    NSLog(@"copyWeakBlock = %@",self.weakBlock);
    
    //static
    static int sValue = 1;
    self.weakBlock = ^ {
        NSLog(@"value = %d",sValue);
    };
    self.weakBlock();
    NSLog(@"sblock = %@",self.weakBlock);
    
    //const
    const int cValue = 1;
    self.weakBlock = ^ {
        NSLog(@"value = %d",cValue);
    };
    self.weakBlock();
    NSLog(@"sblock = %@",self.weakBlock);
    
    //------------__NSStackBlock__------------
    //
    int value = 1;
    self.weakBlock = ^ {
        NSLog(@"value = %d",value);
    };
    self.weakBlock();
    NSLog(@"block1 = %@",self.weakBlock);
    
    //__block
    __block int blockValue = 1;
    self.weakBlock = ^ {
        blockValue = 2;
    };
    self.weakBlock();
    NSLog(@"block2 = %@",self.weakBlock);
    
    //
    NSString *string = @"11111";
    self.weakBlock = ^ {
        NSLog(@"string = %@",string);
    };
    self.weakBlock();
    NSLog(@"block3 = %@",self.weakBlock);
    
    //
    __block NSString *blockString = @"22222";
    self.weakBlock = ^ {
        NSLog(@"blockString = %@",blockString);
        blockString = @"3333";
        NSLog(@"blockString = %@",blockString);
    };
    NSLog(@"blockString = %@",blockString);
    self.weakBlock();
    NSLog(@"blockString = %@",blockString);
    NSLog(@"block4 = %@",self.weakBlock);
    
    //
    self.weakBlock = ^ {
        NSLog(@"self = %@",self);
    };
    self.weakBlock();
    NSLog(@"block5 = %@",self.weakBlock);
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
