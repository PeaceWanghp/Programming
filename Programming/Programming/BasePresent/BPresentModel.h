//
//  BPresentModel.h
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BPresentHeaderModel.h"
#import "BPresentItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPresentModel : NSObject


@property (nonatomic,strong,readonly) NSMutableArray *groupDataSource;
@property (nonatomic,strong,readonly) NSMutableArray *dataSource;

- (void)appendHeader:(NSString *)title;//default "status" is closed
- (void)appendOpenedHeader:(NSString *)title;

- (void)appendItemWithTitle:(NSString *)title class:(Class)className;//enter next page
- (void)appendDarkItemWithTitle:(NSString *)title class:(Class)className;//enter next page

- (void)appendItemTitle:(NSString *)title target:(id)target selector:(SEL)selector;//do "selector"
- (void)appendDarkItemTitle:(NSString *)title target:(id)target selector:(SEL)selector;//do "selector"

- (void)appendTagItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;//Record hit count
- (void)appendDarkTagItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;//Record hit count

@end

NS_ASSUME_NONNULL_END
