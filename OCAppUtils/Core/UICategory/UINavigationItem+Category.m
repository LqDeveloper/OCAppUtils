//
//  UINavigationItem+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "UINavigationItem+Category.h"

@implementation UINavigationItem (Category)
- (void)setupLeftBarButtonItem:(CGFloat)width image:(UIImage *)image target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor{
    self.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
    self.leftBarButtonItem.width = width;
    self.leftBarButtonItem.imageInsets = UIEdgeInsetsZero;
    self.leftBarButtonItem.tintColor = tintColor;
}

- (void)setupLeftBarButtonItem:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor{
    self.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    self.leftBarButtonItem.width = width;
    [self.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} forState:UIControlStateNormal];
    self.leftBarButtonItem.tintColor = tintColor;
}

- (void)setupRightBarButtonItem:(CGFloat)width image:(UIImage *)image target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor{
    self.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
    self.rightBarButtonItem.width = width;
    self.rightBarButtonItem.imageInsets = UIEdgeInsetsZero;
    self.rightBarButtonItem.tintColor = tintColor;
}

- (void)setupRightBarButtonItem:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor{
    self.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    self.rightBarButtonItem.width = width;
    [self.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} forState:UIControlStateNormal];
    self.rightBarButtonItem.tintColor = tintColor;
}


@end
