//
//  UINavigationBar+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Category)

/// 设置title字体和颜色
/// @param font 字体
/// @param color 颜色
-(void)setTitleFont:(UIFont *)font color:(UIColor *)color;

/// 设置title字体和颜色
/// @param font 字体
/// @param color 颜色
/// @param bgColor 背景颜色
-(void)setTitleFont:(UIFont *)font color:(UIColor *)color backgroundColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
