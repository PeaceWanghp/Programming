//
//  ALGLinkController.h
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OC_LinkNode : NSObject
@property (nonatomic,assign) int value;
@property (nonatomic,assign) BOOL isLoop;
@property (nonatomic,strong) OC_LinkNode *nextNode;
@property (nonatomic,strong) OC_LinkNode *anyNode;
- (instancetype)initWithInt:(int)value;
@end

@interface ALGLinkController : BPresentController
- (OC_LinkNode *)createLink;
- (void)printLink:(OC_LinkNode *)headerNode;
@end

NS_ASSUME_NONNULL_END
