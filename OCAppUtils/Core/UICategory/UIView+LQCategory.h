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
@property(nonatomic,strong)IBInspectable UIColor* borderColor;
@property(nonatomic,assign)IBInspectable CGFloat borderWidth;
@property(nonatomic,assign)IBInspectable CGFloat cornerRadius;
@property(nonatomic,strong)IBInspectable UIColor* shadowColor;
@property(nonatomic,assign)IBInspectable CGSize shadowOffset;
@property(nonatomic,assign)IBInspectable float shadowOpacity;
@property(nonatomic,assign)IBInspectable CGFloat shadowRadius;
@property(nonatomic,strong,readonly)UIImage *screenshot;
@property(nonatomic,strong,readonly,nullable)UIViewController *parentResponderVC;
@property(nonatomic,assign)CGPoint origin;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign,readonly)CGFloat maxX;
@property(nonatomic,assign,readonly)CGFloat maxY;

- (UIViewController *)getCurrentVCWithWindow:(UIWindow *)window;
- (void)roundCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)addSubviews:(NSArray<UIView *>*)subviews;
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
