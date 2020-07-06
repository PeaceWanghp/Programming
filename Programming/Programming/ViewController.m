//
//  ViewController.m
//  Programming
//
//  Created by Peace on 6/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ViewController.h"

//C
#import "CHomeworkController.h"
#import "CLibsController.h"

//iOS
#import "iOSToolsController.h"

//CocoaUI
#import "CUOffScreenController.h"
#import "CUHitTestController.h"
#import "CUFrameBoundsViewController.h"

//Objective-C
#import "OCTimerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.model appendHeader:@"Algorithms(算法)"];
    [self.model appendItemWithTitle:@"理论" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Array(数组)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Stack(栈)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Queue(队列)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Link(链表)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Tree(树)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Hash(散列表)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Heap(堆)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Graph(图)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Other(其他)" class:[UIViewController class]];
    
    [self.model appendHeader:@"Internet(网络)"];
    [self.model appendItemWithTitle:@"TCP/IP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Socket" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Web Socket" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DNS" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Ping" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"SSL" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"StartTLS" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Http" class:[UIViewController class]];
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
    
    [self.model appendOpenedHeader:@"Objective-C"];
    [self.model appendDarkItemWithTitle:@"Timer" class:[OCTimerController class]];
    [self.model appendItemWithTitle:@"Runloop" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Runtime" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Block" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Categray" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Extention" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Protocol" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"KVC" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"KVO" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Thread(多线程)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Lock(锁)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Pointer(指针)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Property(属性)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"MessageForwarding(消息转发)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"容器" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"RetainCount" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"深浅拷贝" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"@import/#import/#include/@class" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"const/extern/static/(关键字)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"#define" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"NSFileManager" class:[UIViewController class]];
    
    [self.model appendHeader:@"Swift"];
    [self.model appendItemWithTitle:@"桥接" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"基本语法" class:[UIViewController class]];
    
    [self.model appendHeader:@"C++"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"C"];
    [self.model appendDarkItemWithTitle:@"Homework" class:[CHomeworkController class]];
    [self.model appendDarkItemWithTitle:@"标准库" class:[CLibsController class]];
    [self.model appendDarkItemWithTitle:@"Array(数组)" class:[CHomeworkController class]];
    
    [self.model appendHeader:@"CocoaUI"];
    [self.model appendDarkItemWithTitle:@"OffScreenRendered(离屏渲染)" class:[CUOffScreenController class]];
    [self.model appendDarkItemWithTitle:@"HitTest" class:[CUHitTestController class]];
    [self.model appendDarkItemWithTitle:@"Frame/Bounds" class:[CUFrameBoundsViewController class]];
    [self.model appendItemWithTitle:@"Layer" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"手势" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"约束" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DispalyLink" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"UITableView" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"转场" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"StoryBoard" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Xib" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"iOS"];
    [self.model appendItemWithTitle:@"Memory Masonry (内存分布)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Crash(引发崩溃)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"追踪/捕捉崩溃" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Memory Leak(内存泄漏)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"启动速度" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"耗电" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"安装包瘦身" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防越狱" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防进程调试" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"反编译" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"重签名" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"沙盒机制" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"InBackground" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Load/Initialize(类加载及初始化)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Tools(工具)" class:[iOSToolsController class]];
    
    [self.model appendHeader:@"Flutter"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"ReactNative"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"编程思想"];
    [self.model appendItemWithTitle:@"面向对象" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"面向过程" class:[UIViewController class]];
    
    [self.model appendHeader:@"音视频"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"DesignPattern(设计模式)"];
    [self.model appendItemWithTitle:@"MVC" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"MVVM" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"MVP" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"单例" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"工厂" class:[UIViewController class]];
}


@end
