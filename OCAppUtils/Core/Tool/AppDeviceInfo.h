//
//  AppDeviceInfo.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDeviceInfo : NSObject
/// 是否是Debug环境
+ (BOOL)isDebug;

/// 是否是iPhone
+ (BOOL)isPhone;

/// 是否是iPad
+ (BOOL)isPad;

/// 是否是iPhoneX系列
+(BOOL)isPhoneXSeries;

/// 是否是iPhone5系列
+ (BOOL)isPhone5Series;

/// 屏幕宽
+ (CGFloat)screenWidth;

/// 屏幕高度
+ (CGFloat)screenHeight;

/// 导航的宽度
+ (CGFloat)navigationHeight;

/// tabBar高度
+ (CGFloat)tabBarHeight;

/// 状态栏高度
+ (CGFloat)statusBarHeight;

/// 安全区域头部的高度
+ (CGFloat)topSpace;

/// 安全区域底部的高度
+ (CGFloat)bottomSpace;

/// 应用的名字
+ (NSString *)appName;

/// 设备的名字（如 "Dennis' iPhone"
+ (NSString *)name;

/// 设备机型名字（如 "iPhone" , "iPod Touch"）
+ (NSString *)model;

/// 本地化设备机型名字
+ (NSString *)localizedModel;

/// 安全区域底部的高度
+ (CGFloat)screenBrightness;

/// 修改屏幕亮度
/// @param brightness 屏幕亮度
+ (void)changeScreenBrightness:(CGFloat)brightness;

/// 应用版本
+ (NSString *)appVersion;

/// 构建版本号
+ (NSString *)buildVersion;

/// 手机系统名称（如iOS ，TVOS）
+ (NSString *)systemName;

/// 手机系统版本（如10.0 ，11.0）
+ (NSString *)systemVersion;

/// 设备型号
+ (NSString *)hardwareString;

/// 设备UUID
+ (NSString *)uuid;

/// 国家编码
+ (NSString *)countryCode;

/// 应用 BundleId
+ (NSString *)bundleId;

/// document文件夹 路径
+ (NSString *)documentPath;

/// cache文件夹 路径
+ (NSString *)cachePath;

/// 沙盒路径
+ (NSString *)rootPath;

/// 总内存容量
+ (NSUInteger)volumeTotalCapacity;

/// 可用内存容量
+ (NSUInteger)volumeAvailableCapacity;
@end

NS_ASSUME_NONNULL_END
