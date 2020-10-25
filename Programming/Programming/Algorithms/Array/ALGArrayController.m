//
//  ALGArrayController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGArrayController.h"

@interface IndexItem : NSObject
@property (nonatomic,assign) int index;
@property (nonatomic,assign) int start;
@property (nonatomic,assign) int length;
+ (IndexItem*)indexItem:(NSString *)string, ...NS_REQUIRES_NIL_TERMINATION;
@end
@implementation IndexItem
+ (IndexItem*)indexItem:(NSString *)string, ...NS_REQUIRES_NIL_TERMINATION {
   IndexItem *item = [[IndexItem alloc] init];
    NSLog(@"print first string: %@",string);
    if (string) {
        va_list args;
        va_start(args, string);
    
        NSString *eachString = string;
        int i = 0;
        while (eachString) {
            eachString = va_arg(args, NSString *);
            if (i == 0) {
                item.index = eachString.intValue;
            }
            else if (i == 1) {
                item.start = eachString.intValue;
            }
            else if (i == 2) {
                item.length = eachString.intValue;
            }
            NSLog(@"print next string %@",eachString);
            ++ i;
        }

        va_end(args);
    }
    
    return item;
}
@end

@interface ALGArrayController ()

@end

@implementation ALGArrayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"顺序表查找"];
    [self.model appendDarkItemTitle:@"顺序查找" target:self selector:@selector(eachSearch)];
    [self.model appendDarkItemTitle:@"二分查找" target:self selector:@selector(halfSearch)];
    [self.model appendDarkItemTitle:@"索引查找/分块查找" target:self selector:@selector(indexSearch)];
}

- (void)todo {
    
}


#pragma mark -
#pragma mark -- 顺序查找
- (void)eachSearch {
    NSArray *array = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
    int searchValue = arc4random_uniform(10);
    NSLog(@"Search %d",searchValue);
    for (int i = 0; i < array.count; ++i) {
        NSNumber *value = [array objectAtIndex:i];
        if (searchValue == value.intValue) {
            NSLog(@"Search Index = %d",i);
        }
    }
}

#pragma mark -
#pragma mark -- 二分查找
- (void)halfSearch {
    int arr[10] = {0,1,2,3,4,5,6,7,8,9};
    int len = 10;
    int x = arc4random_uniform(len);
    NSLog(@"Search %d",x);
    int left = 0, right = len-1;
    while(left <= right){
        int mid = (left + right) / 2;
        NSLog(@"left = %d; mid = %d; right = %d",left,mid,right);
        if (x == arr[mid]) {
            NSLog(@"value = %d",mid);
            return;
        }
        
        if (x > arr[mid]) {
            left = mid + 1;
        }
        else {
            right = mid -1;
        }
    }
    
    NSLog(@"not find");
}

#pragma mark -
#pragma mark -- 索引查找/分块查找
- (void)indexSearch {
    int array[100] = {101,102,105,109,0,0,0,0,0,0,
                      201,202,205,209,0,0,0,0,0,0,
                      301,302,305,309,0,0,0,0,0,0,
                      401,402,405,409,0,0,0,0,0,0};
    
    IndexItem *item1 = [[IndexItem alloc] init];
    item1.index = 1;
    item1.start = 0;
    item1.length = 5;
    
    IndexItem *item2 = [[IndexItem alloc] init];
    item2.index = 2;
    item2.start = 10;
    item2.length = 5;
    
    IndexItem *item3 = [[IndexItem alloc] init];
    item3.index = 3;
    item3.start = 20;
    item3.length = 5;
    
    IndexItem *item4 = [[IndexItem alloc] init];
    item4.index = 4;
    item4.start = 30;
    item4.length = 5;
    
    NSArray <IndexItem*>*indexItemList = @[item1,item2,item3,item4];
    

    IndexItem *item = nil;

    // 建立索引规则
    int key = 409;
    int index = key / 100;

    // ① 遍历索引表，找到对应的索引项
    for (int i = 0; i < indexItemList.count; i++) {
        // 找到索引项
        if (indexItemList[i].index == index) {
            item = indexItemList[i];
            break;
        }
    }

    // 索引表中不存在该索引项
    if (!item) {
        NSLog(@"not search");
        return;
    }

    // ② 根据索引项，在主表中查找
    for (int i = item.start; i < item.start + item.length; i++) {
        if (array[i] == key) {
            NSLog(@"search value = %d",i);
            return;
        }
    }
    
    NSLog(@"not search");
}

@end
