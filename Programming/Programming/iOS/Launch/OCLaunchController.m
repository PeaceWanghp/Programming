//
//  OCLaunchController.m
//  Programming
//
//  Created by Peace on 11/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLaunchController.h"
#import "BPWebViewController.h"

@interface OCLaunchController ()

@end

@implementation OCLaunchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"启动速度："];
    [self.model appendDarkItemWithTitle:@"美团冷启动介绍" class:[BPWebViewController class]];
    
    [self.model appendOpenedHeader:@"T1："];
    [self.model appendDarkItemWithTitle:@"点击app----->执行main()"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"1.动态库加载越多，启动越慢。"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"2.ObjC类，方法越多，启动越慢。"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"3.ObjC的+load越多，启动越慢。"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"4.C的constructor函数越多，启动越慢。"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"5.C++静态对象越多，启动越慢。"
                                  class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"T2："];
    [self.model appendDarkItemWithTitle:@"执行main()----->didFinishLaunchingWithOptions完成"
                                  class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"T3："];
    [self.model appendDarkItemWithTitle:@"初始化Home页、定位、请求、渲染"
                                  class:[UIViewController class]];
    
}

@end
