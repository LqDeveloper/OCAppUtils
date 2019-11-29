//
//  NSString+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
- (CGSize)getSizeFromSize:(CGSize)size font:(UIFont *)font{
    return[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (CGFloat)getHeightFromWidth:(CGFloat)width font:(UIFont *)font{
    return [self getSizeFromSize:CGSizeMake(width, 0) font:font].height;
}

- (CGFloat)getWidthFromHeight:(CGFloat)height font:(UIFont *)font{
    return [self getSizeFromSize:CGSizeMake(0, height) font:font].width;
}
@end
