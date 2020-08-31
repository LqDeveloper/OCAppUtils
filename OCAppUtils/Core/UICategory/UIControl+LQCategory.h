//
//  UIControl+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/8/31.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (LQCategory)

/// 添加事件处理
/// @param handler 处理回调
/// @param controlEvents 处理的事件
- (void)bk_addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

/// 移除事件处理
/// @param controlEvents 移除的事件
- (void)bk_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

/// 是否处理了某个事件
/// @param controlEvents 某个事件
- (BOOL)bk_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
