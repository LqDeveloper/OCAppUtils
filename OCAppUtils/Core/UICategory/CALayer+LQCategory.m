//
//  CALayer+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/19.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import "CALayer+LQCategory.h"

@implementation CALayer (LQCategory)
- (void)skt_setShadowWithColor:(UIColor *)color andAlpha:(CGFloat)alpha andX:(CGFloat)x andY:(CGFloat)y andBlur:(CGFloat)blur andSpread:(CGFloat)spread{
    self.shadowOffset = CGSizeMake(x, y);
    self.shadowRadius = blur * 0.5;
    self.shadowOpacity = alpha;
    self.shadowColor = color.CGColor;
    CGRect rect =  CGRectInset(self.bounds, -spread, -spread);
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
    self.shadowPath = path.CGPath;
}
@end
