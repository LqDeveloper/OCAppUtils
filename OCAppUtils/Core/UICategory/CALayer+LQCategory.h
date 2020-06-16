//
//  CALayer+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/19.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (LQCategory)

/// 根据sketch设计图设置阴影
/// @param color 阴影颜色
/// @param alpha 阴影透明度
/// @param x sketch中offset的x
/// @param y sketch中offset的y
/// @param blur sketch中effect的Blur
/// @param spread sketch中effect的Spread
-(void)skt_setShadowWithColor:(UIColor*)color andAlpha:(CGFloat)alpha andX:(CGFloat)x  andY:(CGFloat)y andBlur:(CGFloat)blur andSpread:(CGFloat)spread;
@end

NS_ASSUME_NONNULL_END
