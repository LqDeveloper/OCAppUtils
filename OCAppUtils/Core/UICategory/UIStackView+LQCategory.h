//
//  UIStackView+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStackView (LQCategory)
+(UIStackView*)createStateView:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing alignment:(UIStackViewAlignment)alignment distribution:(UIStackViewDistribution)distribution;

-(void)addArrangedSubviews:(NSArray<UIView *> *)views;
-(void)removeArrangedSubviews;
@end

NS_ASSUME_NONNULL_END
