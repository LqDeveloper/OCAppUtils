//
//  UIView+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LQCategory)
/// 边框颜色
@property(nonatomic,strong)IBInspectable UIColor* borderColor;
/// 边框宽度
@property(nonatomic,assign)IBInspectable CGFloat borderWidth;
/// 圆角
@property(nonatomic,assign)IBInspectable CGFloat cornerRadius;
/// 阴影颜色
@property(nonatomic,strong)IBInspectable UIColor* shadowColor;
/// 阴影偏移
@property(nonatomic,assign)IBInspectable CGSize shadowOffset;
/// 阴影透明度
@property(nonatomic,assign)IBInspectable float shadowOpacity;
/// 阴影圆角
@property(nonatomic,assign)IBInspectable CGFloat shadowRadius;
/// 截图
@property(nonatomic,strong,readonly)UIImage *screenshot;
/// 根据响应链获取到所在的viewController
@property(nonatomic,strong,readonly,nullable)UIViewController *parentResponderVC;
/// 位置
@property(nonatomic,assign)CGPoint origin;
/// 大小
@property(nonatomic,assign)CGSize size;
/// x坐标
@property(nonatomic,assign)CGFloat x;
/// y坐标
@property(nonatomic,assign)CGFloat y;
/// 宽度
@property(nonatomic,assign)CGFloat width;
/// 高度
@property(nonatomic,assign)CGFloat height;
/// 最大x
@property(nonatomic,assign,readonly)CGFloat maxX;
/// 最大y
@property(nonatomic,assign,readonly)CGFloat maxY;

/// 根据window获取当前VC
/// @param window window
- (UIViewController *)getParentVCWithWindow:(UIWindow *)window;

/// 设置圆角
/// @param corners 设置哪个角为圆角 如左上，右上 UIRectCornerTopLeft|UIRectCornerTopRight
/// @param radius 圆角大小
- (void)roundCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/// 添加子视图
/// @param subviews 子视图数组
- (void)addSubviews:(NSArray<UIView *>*)subviews;

/// 移除所有子视图
- (void)removeSubviews;

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
