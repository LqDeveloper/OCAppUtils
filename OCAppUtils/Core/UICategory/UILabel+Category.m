//
//  UILabel+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)
+(UILabel *)label:(NSString *)text textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.textAlignment = alignment;
    return label;
}

+(UILabel *)label:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)alignment{
    UILabel *label = [UILabel label:text textColor:color textAlignment:alignment];
    label.backgroundColor = bgColor;
    return label;
}
@end
