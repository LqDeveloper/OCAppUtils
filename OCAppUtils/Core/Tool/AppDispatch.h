//
//  Dispatch.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/20.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDispatch : NSObject
/// 串行队列
+(dispatch_queue_t)serialQueue:(const char *_Nullable)label;
/// 并发队列
+(dispatch_queue_t)concurrentQueue:(const char *_Nullable)label;
/// global队列
/// @param priority 优先级
///#define DISPATCH_QUEUE_PRIORITY_HIGH 2 // 高优先级
///#define DISPATCH_QUEUE_PRIORITY_DEFAULT 0 // 默认（中）优先级
///#define DISPATCH_QUEUE_PRIORITY_LOW (-2) // 低优先级
///#define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台优先级
+(dispatch_queue_t)globalQueue:(long)priority;

/// 在主线程上异步运行
/// @param block block
+(void)runAsyncOnMainThread:(dispatch_block_t)block;

/// 创建队列组
+(dispatch_group_t)group;

/// 同步运行
/// @param queue 运行在的队列
/// @param block block
+(void)runSync:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;

/// 异步运行
/// @param queue 运行在的队列
/// @param block block
+(void)runAsync:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;

///GCD的栅栏方法 当任务需要异步进行，但是这些任务需要分成两组来执行，第一组完成之后才能进行第二组的操作。
/// @param queue 运行在的队列
/// @param block block
+(void)runAsyncOnBarrier:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;

/// 在一段时间后运行
/// @param time 时间 dispatch_time_t
/// @param queue 运行在的队列
/// @param block block
+(void)runAfterTime:(dispatch_time_t)time andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;

/// 几秒后运行
/// @param second 秒
/// @param queue 运行在的队列
/// @param block block
+(void)runAfterNow:(float)second andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;

/// 快速遍历
/// @param iterations 遍历次数
/// @param queue 运行在的队列
/// @param block block
+(void)runApplySize:(size_t)iterations andQueue:(dispatch_queue_t)queue andBlock:(void (^)(size_t))block;


/// 当线程中嵌套异步线程时可以使用这两个方法，这两个函数必须配对使用
+(void)enterGroup:(dispatch_group_t)group;
+(void)leaveGorup:(dispatch_group_t)group;

/// 队列组 异步执行几个耗时操作，当这几个操作都完成之后再回到主线程进行操作
/// @param group 组
/// @param queue 运行在的队列
/// @param block block
+(void)runOnGroup:(dispatch_group_t)group andQueue:(dispatch_queue_t)queue andBlock:(dispatch_block_t)block;
@end

NS_ASSUME_NONNULL_END
