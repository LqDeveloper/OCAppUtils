//
//  UIImageView+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)
+ (UIImageView *)createWithImageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    return imageView;
}
@end
