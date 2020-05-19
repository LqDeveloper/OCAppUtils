//
//  UIImage+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIImage+LQCategory.h"
@implementation UIImage (LQCategory)
- (NSUInteger)bytesSize{
    NSData *data = UIImagePNGRepresentation(self);
    if (!data) {
        data = UIImageJPEGRepresentation(self, 0.5);//0.5才接近原图片大小
    }
    return [data length];
}

- (UIImage *)originalImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

-(UIImage *)templateImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (NSData *)compressedData:(CGFloat)quality{
    return UIImageJPEGRepresentation(self, quality);
}

- (UIImage *)compressed:(CGFloat)quality{
    return [UIImage imageWithData:[self compressedData:quality]];
}

- (UIImage *)cropped:(CGRect)rect{
    if (rect.size.width > self.size.width || rect.size.height > self.size.height) {
        return self;
    }
    return  [UIImage imageWithCGImage:CGImageCreateWithImageInRect([self CGImage], rect)];
}

- (UIImage *)scaledWithWidth:(CGFloat)width opaque:(BOOL)opaque{
    CGFloat scale  = width / self.size.width;
    CGFloat newHeight = self.size.height * scale;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, newHeight), opaque, self.scale);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaledWithHeight:(CGFloat)height opaque:(BOOL)opaque{
    CGFloat scale  = height / self.size.height;
    CGFloat newWidth = self.size.width * scale;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, height), opaque, self.scale);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)roundedCorners:(CGFloat)radius{
    CGFloat maxRadius = MIN(self.size.width, self.size.height) / 2;
    CGFloat cornerRadius;
    if (radius > 0 && radius <= maxRadius){
        cornerRadius = radius;
    }else{
        cornerRadius = maxRadius;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)createImage:(UIColor *)color size:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, false, 1);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
