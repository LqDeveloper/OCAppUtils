//
//  UIButton+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIButton+LQCategory.h"
@implementation UIButton (LQCategory)
+(UIButton*)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.normalTitle = title;
    button.normalTitleColor = color;
    button.backgroundColor = bgColor;
    return button;
}

+(UIButton*)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor normalImage:(NSString *)norImageName{
    UIButton *button = [UIButton buttonWithTitle:title titleColor:color backgroundColor:bgColor];
    button.normalImage = [UIImage imageNamed:norImageName];
    return button;
}

+(UIButton*)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor normalImage:(NSString *)norImageName selectImage:(NSString *)selImageName{
    UIButton *button = [UIButton buttonWithTitle:title titleColor:color backgroundColor:bgColor normalImage:norImageName];
    button.selectImage = [UIImage imageNamed:selImageName];
    return button;
}

+(UIButton*)buttonWithNormalImage:(NSString *)norImageName selectImage:(NSString *)selImageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.normalImage = [UIImage imageNamed:norImageName];
    button.selectImage = [UIImage imageNamed:selImageName];
    return button;
}


- (void)setNormalTitle:(NSString *)normalTitle{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}
- (NSString *)normalTitle{
    return [self titleForState:UIControlStateNormal];
}

- (void)setSelectTitle:(NSString *)selectTitle{
    [self setTitle:selectTitle forState:UIControlStateSelected];
}
- (NSString *)selectTitle{
    return [self titleForState:UIControlStateSelected];
}

- (void)setDisabledTitle:(NSString *)disabledTitle{
    [self setTitle:disabledTitle forState:UIControlStateDisabled];
}
- (NSString *)disabledTitle{
    return [self titleForState:UIControlStateDisabled];
}

- (void)setHighlightTitle:(NSString *)highlightTitle{
    [self setTitle:highlightTitle forState:UIControlStateHighlighted];
}
- (NSString *)highlightTitle{
    return [self titleForState:UIControlStateHighlighted];
}



- (void)setNormalTitleColor:(UIColor *)normalTitleColor{
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
}
- (UIColor *)normalTitleColor{
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor{
    [self setTitleColor:selectTitleColor forState:UIControlStateSelected];
}
- (UIColor *)selectTitleColor{
    return [self titleColorForState:UIControlStateSelected];
}

- (void)setDisabledTitleColor:(UIColor *)disabledTitleColor{
    return [self setTitleColor:disabledTitleColor forState:UIControlStateDisabled];
}
- (UIColor *)disabledTitleColor{
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)setHighlightTitleColor:(UIColor *)highlightTitleColor{
    [self setTitleColor:highlightTitleColor forState:UIControlStateHighlighted];
}
- (UIColor *)highlightTitleColor{
    return [self titleColorForState:UIControlStateHighlighted];
}



- (void)setNormalImage:(UIImage *)normalImage{
    [self setImage:normalImage forState:UIControlStateNormal];
}
- (UIImage *)normalImage{
    return [self imageForState:UIControlStateNormal];
}

- (void)setSelectImage:(UIImage *)selectImage{
    [self setImage:selectImage forState:UIControlStateSelected];
}
- (UIImage *)selectImage{
    return  [self imageForState:UIControlStateSelected];
}

- (void)setDisabledImage:(UIImage *)disabledImage{
    [self setImage:disabledImage forState:UIControlStateDisabled];
}
- (UIImage *)disabledImage{
    return [self imageForState:UIControlStateDisabled];
}

- (void)setHighlightImage:(UIImage *)highlightImage{
    [self setImage:highlightImage forState:UIControlStateHighlighted];
}
- (UIImage *)highlightImage{
    return [self imageForState:UIControlStateHighlighted];
}

- (void)centerTextAndImage:(CGFloat)space{
    CGFloat insetAmount = space / 2;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
}

- (void)setImage:(ImageLocation)location space:(CGFloat)space{
    CGFloat imageWidth = self.imageView.bounds.size.width;
    CGFloat imageHeight = self.imageView.bounds.size.height;
    CGFloat titleWidth = self.titleLabel.bounds.size.width;
    CGFloat titleHeight = self.titleLabel.bounds.size.height;
    CGFloat insetAmount = space / 2;
    
    if (location == ImageLocationLeft) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0,-insetAmount, 0, insetAmount);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount);
    }else if (location == ImageLocationRight){
        self.imageEdgeInsets = UIEdgeInsetsMake(0,(titleWidth + insetAmount), 0, -(titleWidth + insetAmount));
        self.titleEdgeInsets = UIEdgeInsetsMake(0,-(imageWidth + insetAmount), 0, (imageWidth + insetAmount));
    }else if (location == ImageLocationTop){
        self.imageEdgeInsets = UIEdgeInsetsMake(-(imageHeight/2 + insetAmount), titleWidth/2, (imageHeight/2 + insetAmount), -(titleWidth/2));
        self.titleEdgeInsets = UIEdgeInsetsMake((titleHeight/2 + insetAmount), -(imageWidth/2), -(titleHeight/2 + insetAmount), imageWidth/2);
    }else if (location == ImageLocationBottom){
        self.imageEdgeInsets = UIEdgeInsetsMake((imageHeight/2 + insetAmount), titleWidth/2, -(imageHeight/2 + insetAmount), -(titleWidth/2));
        self.titleEdgeInsets = UIEdgeInsetsMake(-(titleHeight/2 + insetAmount), -(imageWidth/2), (titleHeight/2 + insetAmount), imageWidth/2);
    }
}


@end
