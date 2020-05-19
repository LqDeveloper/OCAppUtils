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
@end
