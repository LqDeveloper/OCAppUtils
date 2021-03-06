//
//  UIView+UIViewCategory_h.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIView+LQCategory.h"

IB_DESIGNABLE
@implementation UIView (LQCategory)
-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
- (UIColor *)borderColor{
    return [[UIColor alloc]initWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}
- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}
- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (UIImage *)screenshot{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.width,self.height), NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)setShadowColor:(UIColor *)shadowColor{
    self.layer.shadowColor = shadowColor.CGColor;
}
- (UIColor *)shadowColor{
    return [[UIColor alloc]initWithCGColor:self.layer.shadowColor];
}


- (void)setShadowOffset:(CGSize)shadowOffset{
    self.layer.shadowOffset = shadowOffset;
}
- (CGSize)shadowOffset{
    return self.layer.shadowOffset;
}

- (void)setShadowOpacity:(float)shadowOpacity{
    self.layer.shadowOpacity = shadowOpacity;
}
- (float)shadowOpacity{
    return self.layer.shadowOpacity;
}

- (void)setShadowRadius:(CGFloat)shadowRadius{
    self.layer.shadowRadius = shadowRadius;
}
- (CGFloat)shadowRadius{
    return self.layer.shadowRadius;
}

- (UIViewController *)parentResponderVC{
    __weak UIResponder *parentResponder = self;
    while (parentResponder != nil) {
        parentResponder = parentResponder.nextResponder;
        if ([parentResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)parentResponder;
        }
    }
    return nil;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin{
    return self.frame.origin;
}


- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size{
    return self.frame.size;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}

- (UIViewController *)getParentVCWithWindow:(UIWindow *)window{
    return [self getCurrentVCFrom:window.rootViewController];
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        currentVC = [rootVC presentedViewController];
    }else if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}


- (void)roundCorners:(UIRectCorner)corners radius:(CGFloat)radius{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    self.layer.mask = shape;
}

- (void)addSubviews:(NSArray<UIView *>*)subviews{
    for (UIView *view in subviews) {
        [self addSubview:view];
    }
}

- (void)removeSubviews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)skt_setShadowWithColor:(UIColor *)color andAlpha:(CGFloat)alpha andX:(CGFloat)x andY:(CGFloat)y andBlur:(CGFloat)blur andSpread:(CGFloat)spread{
    self.layer.shadowOffset = CGSizeMake(x, y);
    self.layer.shadowRadius = blur * 0.5;
    self.layer.shadowOpacity = alpha;
    self.layer.shadowColor = color.CGColor;
    CGRect rect =  CGRectInset(self.bounds, -spread, -spread);
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.layer.cornerRadius];
    self.layer.shadowPath = path.CGPath;
}
@end
