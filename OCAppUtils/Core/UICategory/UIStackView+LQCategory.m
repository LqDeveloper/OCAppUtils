//
//  UIStackView+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIStackView+LQCategory.h"

@implementation UIStackView (LQCategory)
+ (UIStackView *)createStateView:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing alignment:(UIStackViewAlignment)alignment distribution:(UIStackViewDistribution)distribution{
    UIStackView *stack = [[UIStackView alloc]init];
    stack.axis = axis;
    stack.spacing = spacing;
    stack.alignment = alignment;
    stack.distribution = distribution;
    return stack;
}

- (void)addArrangedSubviews:(NSArray<UIView *> *)views{
    for (UIView *view in views) {
        [self addArrangedSubview:view];
    }
}

- (void)removeArrangedSubviews{
    for (UIView *view in self.arrangedSubviews) {
        [self removeArrangedSubview:view];
    }
}

@end
