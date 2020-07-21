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
#import "CExamController.h"

//iOS
#import "OC_CrashController.h"
#import "iOSMemoryLeakController.h"

//CocoaUI
#import "CUOffScreenController.h"
#import "CUHitTestController.h"
#import "CUFrameBoundsViewController.h"

//Objective-C
#import "OCImportController.h"
#import "OCThreadController.h"
#import "OCLocksController.h"
#import "OCTimerController.h"
#import "OCPointerController.h"
#import "OCKeywordsController.h"
#import "OCCategaryController.h"
#import "OCExtensionController.h"
#import "OCProtocolController.h"
#import "OCLoadInitializeController.h"
#import "OCCopyController.h"
#import "OCRetainCountController.h"
#import "OCPropertyController.h"
#import "OCMessageForwardingController.h"
#import "OCRuntimeController.h"
#import "OCBlockController.h"

//Algorithm
#import "AlgorithmsController.h"
#import "ALGOtherController.h"
#import "ALGArrayController.h"
#import "ALGStackController.h"
#import "ALGQueueController.h"
#import "ALGLinkController.h"
#import "ALGTreeController.h"
#import "ALGHashController.h"
#import "ALGHeapController.h"
#import "ALGGraphController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.model appendHeader:@"Algorithms(算法)"];
    [self.model appendDarkItemWithTitle:@"理论" class:[AlgorithmsController class]];
    [self.model appendItemWithTitle:@"Array(数组)" class:[ALGArrayController class]];
    [self.model appendItemWithTitle:@"Stack(栈)" class:[ALGStackController class]];
    [self.model appendItemWithTitle:@"Queue(队列)" class:[ALGQueueController class]];
    [self.model appendItemWithTitle:@"Link(链表)" class:[ALGLinkController class]];
    [self.model appendItemWithTitle:@"Tree(树)" class:[ALGTreeController class]];
    [self.model appendItemWithTitle:@"Hash(散列表)" class:[ALGHashController class]];
    [self.model appendItemWithTitle:@"Heap(堆)" class:[ALGHeapController class]];
    [self.model appendItemWithTitle:@"Graph(图)" class:[ALGGraphController class]];
    [self.model appendDarkItemWithTitle:@"* Other(其他)" class:[ALGOtherController class]];
    
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
    [self.model appendItemWithTitle:@"CoreData" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Objective-C"];
    [self.model appendDarkItemWithTitle:@"* Runtime（运行时）" class:[OCRuntimeController class]];
    [self.model appendItemWithTitle:@"Runloop（运行循环）" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"MessageForwarding(消息转发)" class:[OCMessageForwardingController class]];
    [self.model appendDarkItemWithTitle:@"RetainCount (引用计数计)" class:[OCRetainCountController class]];
    [self.model appendDarkItemWithTitle:@"Thread (多线程)" class:[OCThreadController class]];
    [self.model appendItemWithTitle:@"Lock (锁)" class:[OCLocksController class]];
    [self.model appendDarkItemWithTitle:@"Timer (计时器)" class:[OCTimerController class]];
    [self.model appendDarkItemWithTitle:@"* Block" class:[OCBlockController class]];
    [self.model appendDarkItemWithTitle:@"Categray (分类)" class:[OCCategaryController class]];
    [self.model appendDarkItemWithTitle:@"Extension (扩展/延展)" class:[OCExtensionController class]];
    [self.model appendDarkItemWithTitle:@"Protocol (接口)" class:[OCProtocolController class]];
    [self.model appendDarkItemWithTitle:@"Load/Initialize (加载/初始化)" class:[OCLoadInitializeController class]];
    [self.model appendDarkItemWithTitle:@"* Property (属性)" class:[OCPropertyController class]];
    [self.model appendDarkItemWithTitle:@"Copy / MutableCopy (深浅拷贝)" class:[OCCopyController class]];
    [self.model appendDarkItemWithTitle:@"* #import/#include/@class" class:[OCImportController class]];
    [self.model appendDarkItemWithTitle:@"* const/extern/static/#define" class:[OCKeywordsController class]];
    [self.model appendDarkItemWithTitle:@"Pointer (指针)" class:[OCPointerController class]];
    [self.model appendItemWithTitle:@"KVC (Key-Value Coding)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"KVO (Key-Value Observer)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"容器" class:[UIViewController class]];
    
    [self.model appendHeader:@"Swift"];
    [self.model appendItemWithTitle:@"桥接" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"基本语法" class:[UIViewController class]];
    
    [self.model appendHeader:@"C++"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"C"];
    [self.model appendDarkItemWithTitle:@"Homework" class:[CHomeworkController class]];
    [self.model appendDarkItemWithTitle:@"Exam" class:[CExamController class]];
    [self.model appendDarkItemWithTitle:@"标准库" class:[CLibsController class]];
    
    [self.model appendHeader:@"CocoaUI"];
    [self.model appendDarkItemWithTitle:@"OffScreenRendered(离屏渲染)" class:[CUOffScreenController class]];
    [self.model appendDarkItemWithTitle:@"HitTest" class:[CUHitTestController class]];
    [self.model appendDarkItemWithTitle:@"Frame/Bounds" class:[CUFrameBoundsViewController class]];
    [self.model appendItemWithTitle:@"Layer (图层)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"手势" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"约束" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DispalyLink" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"UITableView" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"转场" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"StoryBoard" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Xib" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"iOS"];
    [self.model appendItemWithTitle:@"Memory Masonry (内存分布)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"*Crash(引发崩溃)" class:[OC_CrashController class]];
    [self.model appendDarkItemWithTitle:@"* Memory Leak(内存泄漏)" class:[iOSMemoryLeakController class]];
    [self.model appendItemWithTitle:@"Launch Speed (启动速度)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"耗电" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"安装包瘦身" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防越狱" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防进程调试" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"反编译" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"重签名" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"沙盒机制" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"InBackground" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Playground" class:[UIViewController class]];
    
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
