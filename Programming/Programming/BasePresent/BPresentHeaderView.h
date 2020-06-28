//
//  BPresendHeaderView.h
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPresentHeaderView : UITableViewHeaderFooterView

- (instancetype)initWithIdentifier:(NSString *)aIdentifier;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) void(^block)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
