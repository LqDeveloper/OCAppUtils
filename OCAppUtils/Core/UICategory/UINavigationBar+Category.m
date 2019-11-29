//
//  UINavigationBar+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "UINavigationBar+Category.h"

@implementation UINavigationBar (Category)
-(void)setTitleFont:(UIFont *)font color:(UIColor *)color{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = font;
    attr[NSForegroundColorAttributeName] = color;
    self.titleTextAttributes = attr;
}

- (void)setTitleFont:(UIFont *)font color:(UIColor *)color backgroundColor:(UIColor *)bgColor{
    [self setTitleFont:font color:color];
    self.translucent = NO;
    self.barTintColor = bgColor;
}
@end
