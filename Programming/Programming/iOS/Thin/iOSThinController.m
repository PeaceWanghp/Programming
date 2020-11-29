//
//  iOSThinController.m
//  Programming
//
//  Created by Peace on 11/29/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSThinController.h"

@interface iOSThinController ()

@end

@implementation iOSThinController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"资源瘦身："];
    [self.model appendDarkItemWithTitle:@"删除无用资源，工具LSUnusedResources"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"删除内容相同的，如：2x/3x是相同像素的"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"无损压缩图片，工具ImageOptim"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"使用Assets.xcassets管理，它会把所有png压缩成一个Assets.car文件，压缩率较高"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"大图优化：切分大图，将图片背景、文案改为代码实现"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"图标优化：修改tintColor复用单色重复图标或旋转复用图标"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"将一些非必或使用频率低的图片/资源放到服务端"
                                  class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"代码优化："];
    [self.model appendDarkItemWithTitle:@"代码层面优化：主要包括删除不用的类，不用的函数，重复的代码等"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Cocoapods 中的优化选项配置"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"指令集优化：工程和工程内静态库删除armv7s指令集，i386,x86_64会编译release时自动删除"
                                  class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"编译选项："];
    [self.model appendDarkItemWithTitle:@"1.Optimization Level\n Release模式为:Fastest,Smallest[-Os]\
                    。这是Xcode上默认的，但我们要知道,意思是开启不增加代码大小的全部优化，并让可执行文件尽可能小。"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"2.Dead Code Stripping：删除静态链接的可执行文件中未引用的代码。\
                                    Debug 设置为NO Release 设置为YES 可减少可执行文件大小。"
                                  class:[UIViewController class]];
}

@end
