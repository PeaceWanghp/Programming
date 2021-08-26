//
//  OCCopyController.m
//  Programming
//
//  Created by Peace on 7/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCCopyController.h"

#import "OCCopyObject.h"

@interface OCCopyController ()
@property(nonatomic,copy) NSNumber *number;
@property(nonatomic,copy) NSMutableArray *array;
@end

@implementation OCCopyController

@synthesize array = _array;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Copy"];
    [self.model appendDarkItemTitle:@"NSNumber copy" target:self selector:@selector(copyNumber)];
    [self.model appendDarkItemTitle:@"NSObject copy" target:self selector:@selector(copyObject)];
    [self.model appendDarkItemTitle:@"UIView copy" target:self selector:@selector(copyUIView)];
    [self.model appendDarkItemTitle:@"NSArray/_NSArray copy" target:self selector:@selector(copyNSArray)];
    
    [self.model appendDarkItemTitle:@"NString copy" target:self selector:@selector(copyString)];
    [self.model appendDarkItemTitle:@"NString mutableCopy" target:self selector:@selector(copyMutableString)];
    
    [self.model appendDarkItemTitle:@"Object shallowCopy (浅拷贝)" target:self selector:@selector(shallowCopyObject)];
    [self.model appendDarkItemTitle:@"Object deepCopy (深拷贝)" target:self selector:@selector(deepCopyObject)];
    
    [self.model appendDarkItemTitle:@"NSArray copy" target:self selector:@selector(copyArray)];
    [self.model appendDarkItemTitle:@"NSArray mutablCopy" target:self selector:@selector(mutableCopyArray)];
    [self.model appendDarkItemTitle:@"NSArray copyItmes" target:self selector:@selector(copyItmes)];
    
    [self.model appendDarkItemTitle:@"测试1" target:self selector:@selector(copyComplex)];
}

- (void)todo {
    
}

#pragma mark -
#pragma mark -- Copy Container
- (void)copyComplex {
    NSString *string = @"1111111111111";
    NSDictionary *dictionary = @{@"key":string,@"key1":self.model};
    NSDictionary *copyDictionary = [dictionary copy];
    NSDictionary *mutableCopyDictionary = [dictionary mutableCopy];
    NSLog(@"%p,%p,%p",dictionary,copyDictionary,mutableCopyDictionary);
}

#pragma mark -
#pragma mark -- Copy NSObject
//copy same
- (void)copyNumber {
    NSNumber *tmp = [NSNumber numberWithInt:5];
    NSLog(@"%p",tmp);
    self.number = tmp;
    NSLog(@"%p",self.number);
}

//Crash: unrecongnized selector sent to instance 0x7xbcd890
- (void)copyObject {
    NSObject *object = [NSObject new];
    [object copy];
}

//Crash: unrecongnized selector sent to instance 0x7xbcd890
- (void)copyUIView {
    UIView *view = [UIView new];
    [view copy];
}

- (void)copyNSArray {
    NSMutableArray *mutalbeArray = [[NSMutableArray alloc] initWithObjects:@"1", nil];
    self.array = [mutalbeArray copy];
    NSLog(@"%@:%p, %@:%p, %@:%p",
          [mutalbeArray class], mutalbeArray,[self.array class],self.array, [_array class],_array);
    
    NSMutableArray *mutalbeArray1 = [[NSMutableArray alloc] initWithObjects:@"2", nil];
    _array = [mutalbeArray1 copy];
    NSLog(@"%@:%p, %@:%p, %@:%p",
    [mutalbeArray1 class], mutalbeArray1,[self.array class],self.array, [_array class],_array);
}

#pragma mark -
#pragma mark -- NSString
- (void)copyString {
    //NSString
    NSString *string = @"stringCopy";
    NSString *copyString = [string copy];
    NSLog(@"1. [%@:%p] copy [%@:%p]",[string class], string, [copyString class], copyString);
    
    //NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutableStringCopy"];
    NSString *copyMutableString = [mutableString copy];
    NSLog(@"2. [%@: %p] copy [%@ : %p]",[mutableString class], mutableString,
                                    [copyMutableString class], copyMutableString);
}

- (void)copyMutableString {
    //NSString
    NSString *string = @"stringCopy";
    NSString *copyString = [string mutableCopy];
    NSLog(@"3. [%@:%p] copy [%@:%p]",[string class], string, [copyString class], copyString);
    
    //NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutableStringCopy"];
    NSMutableString *mutableCopyMutableString = [mutableString mutableCopy];
    NSLog(@"4. [%@: %p] mutableCopy [%@ : %p]",[mutableString class], mutableString,
                                    [mutableCopyMutableString class], mutableCopyMutableString);
}

#pragma mark -
#pragma mark -- Object
- (void)shallowCopyObject {
    OCCopyObject *object = [[OCCopyObject alloc] init];
    object.name = @"wow";
    
    //浅拷贝
    OCCopyObject *copyObject = [object copy];
    
    NSLog(@"[%@: %p] copy [%@ : %p]",[object class], object, [copyObject class], copyObject);
    
    NSLog(@"retainCount = %@ : %@",[object valueForKey:@"retainCount"],[copyObject valueForKey:@"retainCount"]);
}

- (void)deepCopyObject {
    OCCopyObject *object = [[OCCopyObject alloc] init];
    object.name = @"wow";
    
    //深拷贝
    OCCopyObject *mutableCopyObject = [object mutableCopy];
    
    NSLog(@"[%@: %p] copy [%@ : %p]",[object class], object, [mutableCopyObject class], mutableCopyObject);
    
    NSLog(@"retainCount = %@ : %@",[mutableCopyObject valueForKey:@"retainCount"],
                                [object valueForKey:@"retainCount"]);
}

#pragma mark -
#pragma mark -- NSArray
- (void)copyArray {
    NSArray *array = @[@"a",@"b",@"c"];
    NSArray *copyArray = [array copy];
    [self printArray:array array:copyArray];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSMutableArray *copyMutableArray = [mutableArray copy];
    [self printArray:mutableArray array:copyMutableArray];
}

- (void)mutableCopyArray {
    NSArray *array = @[@"a",@"b",@"c"];
    NSArray *copyArray = [array mutableCopy];
    [self printArray:array array:copyArray];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSMutableArray *copyMutableArray = [mutableArray mutableCopy];
    [self printArray:mutableArray array:copyMutableArray];
}

- (void)copyItmes {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSArray *copyArray = [[NSArray alloc] initWithArray:mutableArray copyItems:YES];
    
    [self printArray:mutableArray array:copyArray];
}

- (void)printArray:(NSArray *)array array:(NSArray *)array2 {
    NSLog(@"=======%p,%p",array,array2);
    for (int i = 0; i < 3; i ++) {
        NSString *string = [array objectAtIndex:i];
        NSString *string2 = [array2 objectAtIndex:i];
        NSLog(@"%p,%p",string,string2);
    }
}

@end
