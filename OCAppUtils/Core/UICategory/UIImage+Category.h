//
//  UIImage+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)
@property(nonatomic,assign,readonly)NSUInteger bytesSize;
@property(nonatomic,assign,readonly)UIImage *originalImage;
@property(nonatomic,assign,readonly)UIImage *templateImage;

/// 压缩图片
/// @param quality 比例
-(UIImage *)compressed:(CGFloat)quality;


/// 压缩图片成NSData
/// @param quality 压缩比例
-(NSData *)compressedData:(CGFloat)quality;

/// 生成剪切图片
/// @param rect 剪切未知
-(UIImage *)cropped:(CGRect)rect;

/// 生成按宽度缩放图片
/// @param width 缩放的高度
/// @param opaque 是否透明
-(UIImage *)scaledWithWidth:(CGFloat)width opaque:(BOOL)opaque;

/// 生成按高度缩放图片
/// @param height 缩放的高度
/// @param opaque 是否透明
-(UIImage *)scaledWithHeight:(CGFloat)height opaque:(BOOL)opaque;


/// 生成添加圆角图片
/// @param radius 半径
-(UIImage *)roundedCorners:(CGFloat)radius;

/// 创建颜色图片
/// @param color 颜色
/// @param size 大小
+(UIImage *)createImage:(UIColor *)color size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
