//
//  UIImageView+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIImageView+LQCategory.h"

@implementation UIImageView (LQCategory)
+ (UIImageView *)createWithImageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    return imageView;
}
@end
