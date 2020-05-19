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
@end

NS_ASSUME_NONNULL_END
