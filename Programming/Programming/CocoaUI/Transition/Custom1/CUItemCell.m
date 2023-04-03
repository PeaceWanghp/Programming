//
//  CUItemCell.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUItemCell.h"

@implementation CUItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.rightTitleLabel];
    }
    return self;
}

- (void)setUpData:(CUItemEntity *)entity {
    [self.leftImageView setImage:entity.image];
    [self.rightTitleLabel setText:entity.title];
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    }
    return _leftImageView;
}

- (UILabel *)rightTitleLabel {
    if (!_rightTitleLabel) {
        _rightTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 100, 20)];
        _rightTitleLabel.textColor = [UIColor blackColor];
    }
    return _rightTitleLabel;
}

@end
