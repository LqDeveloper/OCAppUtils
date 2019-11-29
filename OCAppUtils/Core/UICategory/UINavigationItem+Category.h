//
//  UINavigationItem+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (Category)
-(void)setupLeftBarButtonItem:(CGFloat)width image:(UIImage *)image target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;

-(void)setupLeftBarButtonItem:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;

-(void)setupRightBarButtonItem:(CGFloat)width image:(UIImage *)image target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;

-(void)setupRightBarButtonItem:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor;
@end

NS_ASSUME_NONNULL_END
