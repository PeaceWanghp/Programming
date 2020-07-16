//
//  OCMRCObject.m
//  Programming
//
//  Created by Peace on 7/15/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMRCObject.h"

@implementation OCMRCObject

- (void)dealloc {
    NSLog(@"%ld : %s",(long)_tag,__func__);
    
    [super dealloc];
}

+ (void)selfRetain {
    //自己生成并持有对象
    OCMRCObject *subObject = [OCMRCObject new];
    subObject.tag = 1;
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject.tag, [subObject retainCount]);
    //自己释放自己持有的对象
    [subObject release];
    
    OCMRCObject *subObject1 = [[OCMRCObject alloc] init];
    subObject1.tag = 2;
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject1.tag, [subObject1 retainCount]);
    [subObject1 release];
    
    OCMRCObject *subObject2 = [[OCMRCObject alloc] init];
    subObject2.tag = 3;
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject2.tag, [subObject2 retainCount]);
#warning subObject2 memory leak
    
    NSLog(@"end.----------");
}

+ (void)notSelfRetain {
    //非自己生成持有的对象
    OCMRCObject *subObject = [[OCMRCObject alloc] init];
    subObject.tag = 3;
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject.tag, [subObject retainCount]);
    #warning subObject memory leak
    
    //非自己生成持有的对象,再对其持有
    OCMRCObject *subObject1 = [[OCMRCObject alloc] init];
    subObject1.tag = 4;
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject1.tag, [subObject1 retainCount]);
    [subObject1 retain];
    NSLog(@"%ld : OC_MRC_SubObject retain count = %ld",(long)subObject1.tag, [subObject1 retainCount]);
    [subObject1 release];
    #warning subObject1 memory leak
}

+ (void)objectAutorelease {
    NSLog(@"--------------");
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    OCMRCObject *subObject = [[OCMRCObject alloc] init];
    subObject.tag = 10;
    [subObject autorelease];
    
    [pool drain];
    NSLog(@"--------------");
}

@end
