//
//  OCDisplayLinkController.m
//  Programming
//
//  Created by Peace on 11/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCDisplayLinkController.h"

#import "OC_Test_CADisplayLink.h"

@interface OCDisplayLinkController ()
{
    OC_Test_CADisplayLink *_displayLink;
}

@end

@implementation OCDisplayLinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _displayLink = [[OC_Test_CADisplayLink alloc] init];
    
    [self.model appendOpenedHeader:@"CADisplayLink"];
    [self.model appendDarkItemTitle:@"Start" target:_displayLink selector:@selector(startLink)];
    [self.model appendDarkItemTitle:@"Cancel" target:_displayLink selector:@selector(cancel)];
}

@end
