//
//  ALGQueueController+Array.h
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGQueueController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArrayQueue : NSObject
{
    int _size;
    int _array[6];
    int _head;
    int _tail;
}
@end

@interface ALGQueueController (Array)
@property (nonatomic,strong) ArrayQueue *arrayQueue;
@end

NS_ASSUME_NONNULL_END
