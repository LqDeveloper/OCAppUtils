//
//  UIColor+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIColor+LQCategory.h"
@implementation UIColor (LQCategory)
+(UIColor*)colorWithRGBHex: (NSInteger) hex {
    NSInteger r = (hex >> 16) & 0xFF;
    NSInteger g = (hex >> 8) & 0xFF;
    NSInteger b = (hex) & 0xFF;
    
    return [UIColor colorWithRed: r / 255.0f
                           green: g / 255.0f
                            blue: b / 255.0f
                           alpha: 1.0f];
}

+(UIColor*)colorWithRGBHex: (NSInteger) hex andAlpha:(CGFloat)alpha{
    NSInteger r = (hex >> 16) & 0xFF;
    NSInteger g = (hex >> 8) & 0xFF;
    NSInteger b = (hex) & 0xFF;
    
    return [UIColor colorWithRed: r / 255.0f
                           green: g / 255.0f
                            blue: b / 255.0f
                           alpha: alpha];
}

+(UIColor*)colorRed255: (NSInteger) red green255:(NSInteger)green blue255:(NSInteger)blue alpha:(CGFloat)alpha{
    return [[UIColor alloc]initWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+(UIColor *)colorWithRGBHexStr:(NSString *)hexStr{
    return [UIColor colorWithRGBHexStr:hexStr andAlpha:1.0];
}

+(UIColor *)colorWithRGBHexStr:(NSString *)hexStr andAlpha:(CGFloat)alpha{
    NSString *str = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([str hasPrefix:@"#"]){
        str = [str stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }else if ([str hasPrefix:@"0x"]) {
        str = [str stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    }
    if ([str length] == 3){
        NSString *red = [str substringToIndex:0];
        NSString *green = [str substringToIndex:1];
        NSString *blue = [str substringToIndex:2];
        str = [NSString stringWithFormat:@"%@%@%@%@%@%@",red,red,green,green,blue,blue];
    }
    if (str.length != 6) {
        return [UIColor blackColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [str substringWithRange:range];
    range.location = 2;
    NSString *gString = [str substringWithRange:range];
    range.location = 4;
    NSString *bString = [str substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}



-(NSDictionary *)rgb{
    CGFloat fRed = 0;
    CGFloat fGreen = 0;
    CGFloat fBlue = 0;
    CGFloat fAlpha = 0;
    BOOL isSuccess = [self getRed:&fRed green:&fGreen blue:&fBlue alpha:&fAlpha];
    if (isSuccess) {
        return @{@"red":@(fRed),@"green":@(fGreen),@"blue":@(fBlue),@"alpha":@(fAlpha)};
    }
    return @{};
}

+ (UIColor *)colorWithLightColor:(UIColor *)light andDarkColor:(UIColor *)dark{
    if (@available(iOS 13.0, *)) {
        return [[UIColor alloc]initWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                return light;
            }else{
                return dark;
            }
        }];
    } else {
        return light;
    }
}

+ (UIColor *)colorWithLight:(NSInteger)light andDark:(NSInteger )dark{
    if (@available(iOS 13.0, *)) {
        return [[UIColor alloc]initWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                return [UIColor colorWithRGBHex:light];
            }else{
                return [UIColor colorWithRGBHex:dark];
            }
        }];
    } else {
        return [UIColor colorWithRGBHex:light];
    }
}

+ (UIColor *)colorWithLight:(NSInteger)light andLightAlpha:(CGFloat)lightAlpha andDark:(NSInteger)dark andDarkAlpha:(CGFloat)darkAlpha{
    if (@available(iOS 13.0, *)) {
        return [[UIColor alloc]initWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                return [UIColor colorWithRGBHex:light andAlpha:lightAlpha];
            }else{
                return [UIColor colorWithRGBHex:dark andAlpha:darkAlpha];
            }
        }];
    } else {
        return [UIColor colorWithRGBHex:light andAlpha:lightAlpha];
    }
}

@end
