//
//  UILabel+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LQCategory)

+(UILabel *)label:(NSString *)text textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment;

+(UILabel *)label:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
