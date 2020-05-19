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
-(NSDictionary*)rgb;
@end

NS_ASSUME_NONNULL_END
