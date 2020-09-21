//
//  BPresentController.h
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BPresentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPresentController : UITableViewController

@property (nonatomic,strong) BPresentModel * model;

- (void)todo;//Default Nothing

@end

NS_ASSUME_NONNULL_END
