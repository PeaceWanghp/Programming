//
//  INHttpController.m
//  Programming
//
//  Created by Peace on 9/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "INHttpController.h"

@interface INHttpController ()

@end

@implementation INHttpController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Http 0.9"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"Http 1.0"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"Http 1.1"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"Http 2.0"];
    [self.model appendItemTitle:@"多路复用(Multiplexing)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"服务端推送(Server Push)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"二进制分帧(Frame)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"首部压缩（Header Compression）" target:self selector:@selector(todo)];
}

@end
