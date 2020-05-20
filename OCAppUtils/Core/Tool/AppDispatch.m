//
//  AppDispatch.m
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/20.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

#import "AppDispatch.h"

@implementation AppDispatch
+(dispatch_queue_t)serialQueue:(const char *_Nullable)label{
    return dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL);
}

+(dispatch_queue_t)concurrentQueue:(const char *)label{
    return dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT);
}

+ (dispatch_queue_t)globalQueue:(long)priority{
    return dispatch_get_global_queue(priority, 0);
}

+ (dispatch_group_t)group{
    return dispatch_group_create();
}

+ (void)runAsyncOnMainThread:(dispatch_block_t)block{
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)runSync:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_sync(queue, block);
}

+ (void)runAsync:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_async(queue, block);
}

+ (void)runAsyncOnBarrier:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_barrier_async(queue, block);
}

+ (void)runAfterTime:(dispatch_time_t)time andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_after(time, queue, block);
}

+ (void)runAfterNow:(float)second andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), queue, block);
}

+(void)runApplySize:(size_t)iterations andQueue:(dispatch_queue_t)queue andBlock:(nonnull void (^)(size_t))block{
    dispatch_apply(iterations, queue, block);
}

+(void)enterGroup:(dispatch_group_t)group{
    dispatch_group_enter(group);
}

+(void)leaveGorup:(dispatch_group_t)group{
    dispatch_group_leave(group);
}

+ (void)runOnGroup:(dispatch_group_t)group andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block{
    dispatch_group_async(group, queue, block);
}
@end
