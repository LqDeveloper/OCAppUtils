//
//  UIAlertController+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (LQCategory)

/// 添加action
/// @param title 标题
/// @param style 风格
/// @param handler 回调
- (void)addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *action))handler;

/// 添加TextField
/// @param text 标题
/// @param placeholder placeholder
/// @param target UIControlEventValueChanged的target
/// @param selector UIControlEventValueChanged响应方法
- (void)addTextField:(NSString *)text placeholder:(NSString *)placeholder valueChangedTarget:(nullable id)target valueChangedSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
