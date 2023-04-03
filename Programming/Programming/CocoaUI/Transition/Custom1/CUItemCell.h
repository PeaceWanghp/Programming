//
//  CUItemCell.h
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CUItemEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUItemCell : UITableViewCell

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UILabel *rightTitleLabel;

- (void)setUpData:(CUItemEntity*)entity;

@end

NS_ASSUME_NONNULL_END
