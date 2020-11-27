//
//  OCRunloopController.m
//  Programming
//
//  Created by Peace on 9/10/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCRunloopController.h"

#import "NSWeakTimer.h"
#import "OCMachPortController.h"
#import "OCDisplayLinkController.h"

@interface OCRunloopController ()
{
    NSTimer *_timer;
}
@end

@implementation OCRunloopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"CFRunLoopRef"];
    [self.model appendDarkItemTitle:@"AutoreleasePoolPage"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"线程和RunLoop是一对一,映射关系是保存在一个全局的 hashTable 里"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"其实它内部就是do-while循环,在这个循环内部不断的处理各种任务(比如Source、Timer、Observer)"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"RunLoop只能选择一个Mode启动,如果当前Mode中没有任何Soure、Timer、Observer,那么就直接退出RunLoop"
                             target:self selector:@selector(todo)];
    
    
    [self.model appendOpenedHeader:@"CFRunLoopModeRef"];
    [self.model appendDarkItemTitle:@"即一个 run loop mode 是若干个 source、timer 和 observer 的集合。它能帮我们过滤掉一些不想要的事件。即一个 RunLoop 在某个 mode 下运行时，不会接收和处理其他 mode 的事件 。要保持一个 mode 活着，就必须往里面添加至少一个 source、timer 或 observer 。" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"NSDefaultRunLoopMode默认的模式，程序运行的大多时候都处于该 mode 下" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"UITrackingRunLoopMode是滑动 tableView 或 scrollerView 时为了界面流畅而用" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"UIInitializationRunLoopMode是程序启动时进入的 mode，一般用不上" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"kCFRunLoopCommonModes它不是一个真正的 mode，而是若干个 mode 的集合。" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"CFRunLoopSourceRef:"];
    [self.model appendDarkItemTitle:@"source0:是app内部的消息机制，使用时需要调用 CFRunLoopSourceSignal()来把这个 source 标记为待处理，然后掉用 CFRunLoopWakeUp() 来唤醒 RunLoop，让其处理这个事件。" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"source1:是基于 mach_ports 的，用于通过内核和其他线程互相发送消息。iOS / OSX 都是基于 Mach 内核，Mach 的对象间的通信是通过消息在两个端口(port)之间传递来完成。" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"总结:事件产生的地方就是source(输入源), 运用发消息的机制，让事件可以唤醒休眠的runloop执行。" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"CFRunLoopTimerRef:"];
    [self.model appendDarkItemTitle:@"NSTimer" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"gcd timer" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"performSelector:afterDelay:" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"CFRunLoopObserverRef:监听状态变化"];
    [self.model appendDarkItemTitle:@"1.即将进入 loop kCFRunLoopEntry" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"2.即将处理 timer kCFRunLoopBeforeTimers " target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"3.即将处理 source kCFRunLoopBeforeSources" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"4.即将 sleep kCFRunLoopBeforeWaiting" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"5.刚被唤醒，退出 sleep kCFRunLoopAfterWaiting" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"6.即将退出 kCFRunLoopExit" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"7.全部的活动 kCFRunLoopAllActivities" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"应用："];
    [self.model appendDarkItemWithTitle:@"DisplayLink" class:[OCDisplayLinkController class]];
    [self.model appendDarkItemWithTitle:@"NSMachPort" class:[OCMachPortController class]];
    [self.model appendItemTitle:@"创建常驻线程" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"创建Timer" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"无感知更新UI" target:self selector:@selector(refreshUI)];
    [self.model appendDarkItemTitle:@"UITableView 与 NSTimer 冲突" target:self selector:@selector(exactTimer)];
    [self.model appendDarkItemTitle:@"UITableView 与 NSTimer 冲突2" target:self selector:@selector(exactTimer2)];
    [self.model appendItemTitle:@"检测卡顿（Observer）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"AutoreleasePool 生命周期" target:self selector:@selector(todo)];
}

#pragma mark -
#pragma mark -- Thread
- (void)runThread {
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    [runLoop run];
}

#pragma mark -
#pragma mark -- Timer
- (void)timerAction {
    NSLog(@"1");

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"2");

        //如果当前线程没有开启RunLoop，该方法会失效
        //如果RunLoop的mode中一个item都没有，RunLoop会退出
        [self performSelector:@selector(test) withObject:nil afterDelay:3];
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"3");
    });

    NSLog(@"4");
}

- (void)test {
    
    NSLog(@"5");
}

- (void)startWeakTimer {
    NSTimer *timer = [NSWeakTimer timerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(exactTimerAction)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)exactTimer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_queue_create(0, 0), ^{
        [weakSelf startWeakTimer];
        
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)exactTimer2 {
    NSTimer *timer = [NSWeakTimer timerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(exactTimerAction)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)exactTimerAction {
    NSLog(@"111111");
}

#pragma mark -
#pragma mark -- UI
- (void)refreshUI {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"11111111");
        [self performSelectorOnMainThread:@selector(reloadRunloopData)
                               withObject:nil
                            waitUntilDone:NO
                                    modes:@[NSDefaultRunLoopMode]];
    });
}

- (void)reloadRunloopData {
    NSLog(@"222222222");
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"....." target:self selector:@selector(todo)];
    [self.tableView reloadData];
}

@end
