//
//  ViewController.m
//  Programming
//
//  Created by Peace on 6/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ViewController.h"

//Network
#import "INHttpController.h"

//iOS
#import "OC_CrashController.h"
#import "iOSMemoryLeakController.h"
#import "iOSMonitorController.h"
#import "OCLaunchController.h"
#import "iOSThinController.h"

//CocoaUI
#import "CUContentModeViewController.h"
#import "CUOffScreenController.h"
#import "CUHitTestController.h"
#import "CUFrameBoundsViewController.h"
#import "CUGestureViewController.h"

//Objective-C
#import "OCRuntimeController.h"
#import "OCRunloopController.h"
#import "OCMemoryController.h"
#import "OCThreadController.h"
#import "OCBlockController.h"
#import "OCGCDController.h"
#import "OCPropertyController.h"
#import "OCExtensionController.h"
#import "OCProtocolController.h"
#import "OCTimerController.h"
#import "OCContainerController.h"
#import "OCImportController.h"
#import "OCLoadInitializeController.h"
#import "OCPointerController.h"
#import "OCKeywordsController.h"
#import "OCMessageController.h"

//Algorithm
#import "AlgorithmsController.h"
#import "ALGLinkController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"111");
    NSLog(@"222");
    NSLog(@"333");
    [self.model appendOpenedHeader:@"Objective-C"];
    [self.model appendDarkItemWithTitle:@"Runtime" class:[OCRuntimeController class]];
    [self.model appendDarkItemWithTitle:@"Runloop" class:[OCRunloopController class]];
    [self.model appendDarkItemWithTitle:@"Memory" class:[OCMemoryController class]];
    [self.model appendDarkItemWithTitle:@"Extension" class:[OCExtensionController class]];
    [self.model appendDarkItemWithTitle:@"Protocol" class:[OCProtocolController class]];
    [self.model appendDarkItemWithTitle:@"Block" class:[OCBlockController class]];
    [self.model appendDarkItemWithTitle:@"GCD (Grand Central Dispatch)" class:[OCGCDController class]];
    [self.model appendDarkItemWithTitle:@"Thread" class:[OCThreadController class]];
    [self.model appendDarkItemWithTitle:@"Timer" class:[OCTimerController class]];
    [self.model appendDarkItemWithTitle:@"Property" class:[OCPropertyController class]];
    [self.model appendDarkItemWithTitle:@"Load/Initialize" class:[OCLoadInitializeController class]];
    [self.model appendDarkItemWithTitle:@"Message" class:[OCMessageController class]];
    [self.model appendDarkItemWithTitle:@"#import/#include/@class" class:[OCImportController class]];
    [self.model appendDarkItemWithTitle:@"const/extern/static/#define" class:[OCKeywordsController class]];
    [self.model appendDarkItemWithTitle:@"NSCache" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Container" class:[OCContainerController class]];
    [self.model appendDarkItemWithTitle:@"Pointer" class:[OCPointerController class]];
    
    [self.model appendHeader:@"Swift"];
    [self.model appendItemWithTitle:@"桥接" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"基本语法" class:[UIViewController class]];
    
    [self.model appendHeader:@"C++"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"C"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"CocoaUI"];
    [self.model appendDarkItemWithTitle:@"Gesture" class:[CUGestureViewController class]];
    [self.model appendDarkItemWithTitle:@"ContentMode" class:[CUContentModeViewController class]];
    [self.model appendDarkItemWithTitle:@"OffScreenRendered(离屏渲染)" class:[CUOffScreenController class]];
    [self.model appendDarkItemWithTitle:@"HitTest" class:[CUHitTestController class]];
    [self.model appendDarkItemWithTitle:@"Frame/Bounds" class:[CUFrameBoundsViewController class]];
    [self.model appendItemWithTitle:@"Layer (图层)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"手势" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"约束" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DispalyLink" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"UITableView" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"UITableView+ScrollViewHeader" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"转场" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"StoryBoard" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Xib" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"needDisplay,dispaly区别" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"iOS"];
    [self.model appendDarkItemWithTitle:@"Launch Speed (启动速度优化)" class:[OCLaunchController class]];
    [self.model appendItemWithTitle:@"耗电量优化" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"安装包瘦身" class:[iOSThinController class]];
    [self.model appendItemWithTitle:@"网络io优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"文件io优化/随意调用db而不使用Cache" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"内存优化" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Memory Leak(内存泄漏)" class:[iOSMemoryLeakController class]];
    [self.model appendDarkItemWithTitle:@"Crash(引发崩溃)" class:[OC_CrashController class]];
    [self.model appendDarkItemWithTitle:@"Monitor(监视器)" class:[iOSMonitorController class]];
    [self.model appendItemWithTitle:@"防越狱" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防进程调试" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"反编译" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"重签名" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"沙盒机制" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"InBackground" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"动态列表" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"自动化测试" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"自动化打包" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Crash分析" class:[UIViewController class]];
    
    [self.model appendHeader:@"Internet(网络)"];
    [self.model appendItemWithTitle:@"TCP/IP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Socket" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Web Socket" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DNS" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Ping" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"SSL" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"StartTLS" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"HTTP" class:[INHttpController class]];
    [self.model appendItemWithTitle:@"Exchange" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Web DAV" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"IMAP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"POP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"SMTP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"BlueTooth(蓝牙)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"JSON" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"SOAP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"XML" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"HTML" class:[UIViewController class]];
    
    [self.model appendHeader:@"DataBase(数据库)"];
    [self.model appendItemWithTitle:@"Sqlite3" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"SQL" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Cipher" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"FMDB" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"LKDBHelper" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"CoreData" class:[UIViewController class]];
    
    [self.model appendHeader:@"Hybrid(混合开发)"];
    [self.model appendItemWithTitle:@"Flutter" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"ReactNative" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Weex" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Html" class:[UIViewController class]];
    
    [self.model appendHeader:@"Algorithms(算法)"];
    [self.model appendDarkItemWithTitle:@"理论" class:[AlgorithmsController class]];
    [self.model appendDarkItemWithTitle:@"Link(链表)" class:[ALGLinkController class]];
    
    [self.model appendHeader:@"音视频协议"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
}

@end
