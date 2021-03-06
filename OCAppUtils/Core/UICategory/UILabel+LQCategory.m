//
//  UILabel+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UILabel+LQCategory.h"

@implementation UILabel (LQCategory)
+(UILabel *)label:(NSString *)text textColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    return label;
}

+(UILabel *)label:(NSString *)text textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment{
    UILabel *label = [UILabel label:text textColor:color];
    label.textAlignment = alignment;
    return label;
}

+(UILabel *)label:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)alignment{
    UILabel *label = [UILabel label:text textColor:color textAlignment:alignment];
    label.backgroundColor = bgColor;
    return label;
}
@end
