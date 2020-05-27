//
//  UIColor+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LQCategory)
+(UIColor*)colorWithRGBHex: (NSInteger) hex;
+(UIColor*)colorWithRGBHex: (NSInteger) hex andAlpha:(CGFloat)alpha;
+(UIColor*)colorRed255: (NSInteger) red green255:(NSInteger)green blue255:(NSInteger)blue alpha:(CGFloat)alpha;
+(UIColor*)colorWithRGBHexStr: (NSString *) hexStr;
+(UIColor*)colorWithRGBHexStr: (NSString *) hexStr andAlpha:(CGFloat)alpha;
-(NSDictionary*)rgb;

+(UIColor *)colorWithLightColor:(UIColor *)light andDarkColor:(UIColor *)dark API_AVAILABLE(ios(13.0));
+(UIColor *)colorWithLight:(NSInteger)light andDark:(NSInteger )dark API_AVAILABLE(ios(13.0));
+(UIColor *)colorWithLight:(NSInteger)light andLightAlpha:(CGFloat)lightAlpha andDark:(NSInteger )dark andDarkAlpha:(CGFloat)darkAlpha API_AVAILABLE(ios(13.0));
@end

NS_ASSUME_NONNULL_END
