//
//  UIButton+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ImageLocation) {
    ImageLocationLeft = 0,
    ImageLocationRight,
    ImageLocationTop,
    ImageLocationBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)
@property(nonatomic,strong)IBInspectable NSString *normalTitle;
@property(nonatomic,strong)IBInspectable NSString *selectTitle;
@property(nonatomic,strong)IBInspectable NSString *disabledTitle;
@property(nonatomic,strong)IBInspectable NSString *highlightTitle;

@property(nonatomic,strong)IBInspectable UIColor *normalTitleColor;
@property(nonatomic,strong)IBInspectable UIColor *selectTitleColor;
@property(nonatomic,strong)IBInspectable UIColor *disabledTitleColor;
@property(nonatomic,strong)IBInspectable UIColor *highlightTitleColor;

@property(nonatomic,strong)IBInspectable UIImage *normalImage;
@property(nonatomic,strong)IBInspectable UIImage *selectImage;
@property(nonatomic,strong)IBInspectable UIImage *disabledImage;
@property(nonatomic,strong)IBInspectable UIImage *highlightImage;



+(UIButton*)button:(NSString *)title titleColor:(UIColor *)color
      backgroundColor:(UIColor *)bgColor;

+(UIButton*)button:(NSString *)title titleColor:(UIColor *)color
      backgroundColor:(UIColor *)bgColor normalImage:(NSString *)norImageName;

+(UIButton*)button:(NSString *)title titleColor:(UIColor *)color
      backgroundColor:(UIColor *)bgColor normalImage:(NSString *)norImageName selectImage:(NSString *)selImageName;

+(UIButton*)button:(NSString *)norImageName selectImage:(NSString *)selImageName;

-(void)centerTextAndImage:(CGFloat)space;

-(void)setImage:(ImageLocation)location space:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
