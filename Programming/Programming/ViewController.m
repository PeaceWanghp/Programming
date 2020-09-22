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

//C
#import "COperatorController.h"
#import "CBasicController.h"
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
#import "OCRuntimeController.h"
#import "OCRunloopController.h"
#import "OCMemoryController.h"
#import "OCThreadController.h"
#import "OCBlockController.h"
#import "OCGCDController.h"
#import "OCPropertyController.h"
#import "OCCategaryController.h"
#import "OCExtensionController.h"
#import "OCProtocolController.h"
#import "OCTimerController.h"
#import "OCContainerController.h"
#import "OCImportController.h"
#import "OCLoadInitializeController.h"
#import "OCPointerController.h"
#import "OCKeywordsController.h"

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
    [self.model appendDarkItemWithTitle:@"Array(数组)" class:[ALGArrayController class]];
    [self.model appendItemWithTitle:@"Stack(栈)" class:[ALGStackController class]];
    [self.model appendDarkItemWithTitle:@"Queue(队列)" class:[ALGQueueController class]];
    [self.model appendDarkItemWithTitle:@"Link(链表)" class:[ALGLinkController class]];
    [self.model appendDarkItemWithTitle:@"Tree(树)" class:[ALGTreeController class]];
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
    [self.model appendItemWithTitle:@"Http" class:[INHttpController class]];
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
    [self.model appendDarkItemWithTitle:@"Runtime（运行时）" class:[OCRuntimeController class]];
    [self.model appendDarkItemWithTitle:@"Runloop（运行循环）" class:[OCRunloopController class]];
    [self.model appendDarkItemWithTitle:@"Memory（内存管理）" class:[OCMemoryController class]];
    [self.model appendDarkItemWithTitle:@"Property (属性)" class:[OCPropertyController class]];
    [self.model appendDarkItemWithTitle:@"Categray (分类)" class:[OCCategaryController class]];
    [self.model appendDarkItemWithTitle:@"Extension (扩展/延展)" class:[OCExtensionController class]];
    [self.model appendDarkItemWithTitle:@"Protocol (接口)" class:[OCProtocolController class]];
    [self.model appendDarkItemWithTitle:@"Block (闭包/代码块)" class:[OCBlockController class]];
    [self.model appendDarkItemWithTitle:@"GCD (Grand Central Dispatch)" class:[OCGCDController class]];
    [self.model appendDarkItemWithTitle:@"Thread (多线程)" class:[OCThreadController class]];
    [self.model appendDarkItemWithTitle:@"Timer (计时器)" class:[OCTimerController class]];
    [self.model appendItemWithTitle:@"Container (容器)" class:[OCContainerController class]];
    [self.model appendDarkItemWithTitle:@"Load/Initialize (加载/初始化)" class:[OCLoadInitializeController class]];
    [self.model appendDarkItemWithTitle:@"* #import/#include/@class" class:[OCImportController class]];
    [self.model appendDarkItemWithTitle:@"* const/extern/static/#define" class:[OCKeywordsController class]];
    [self.model appendDarkItemWithTitle:@"Pointer (指针)" class:[OCPointerController class]];
    [self.model appendItemWithTitle:@"KVC (Key-Value Coding)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"KVO (Key-Value Observer)" class:[UIViewController class]];
    
    [self.model appendHeader:@"Swift"];
    [self.model appendItemWithTitle:@"桥接" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"基本语法" class:[UIViewController class]];
    
    [self.model appendHeader:@"C++"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"C"];
    [self.model appendDarkItemWithTitle:@"Operator (运算符，异或...)" class:[COperatorController class]];
    [self.model appendDarkItemWithTitle:@"Basic (基础)" class:[CBasicController class]];
    [self.model appendDarkItemWithTitle:@"Homework (作业)" class:[CHomeworkController class]];
    [self.model appendDarkItemWithTitle:@"Exam (考试)" class:[CExamController class]];
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
    [self.model appendDarkItemWithTitle:@"*Crash(引发崩溃)" class:[OC_CrashController class]];
    [self.model appendDarkItemWithTitle:@"* Memory Leak(内存泄漏)" class:[iOSMemoryLeakController class]];
    [self.model appendItemWithTitle:@"约束过多" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"安装包瘦身" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防越狱" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"防进程调试" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"反编译" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"重签名" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"沙盒机制" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"InBackground" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Playground" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"性能优化"];
    [self.model appendItemWithTitle:@"Launch Speed (启动速度优化)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"耗电量优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"网络io优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"文件io优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"内存优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"UI流畅度优化" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"随意调用db而不使用Cache" class:[UIViewController class]];
    
    [self.model appendHeader:@"Flutter"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"ReactNative"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
    
    [self.model appendHeader:@"音视频"];
    [self.model appendItemWithTitle:@"..." class:[UIViewController class]];
}

@end
