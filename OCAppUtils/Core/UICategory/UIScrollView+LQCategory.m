//
//  UIScrollView+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIScrollView+LQCategory.h"

@implementation UIScrollView (LQCategory)
- (UIImage *)screenshot{
    UIGraphicsBeginImageContextWithOptions(self.contentSize, false, 0);
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGRect previousFrame = self.frame;
    self.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    [self.layer renderInContext:context];
    self.frame = previousFrame;
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
