//
//  UIApplication+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (LQCategory)

/// 打开链接
/// @param urlStr 链接
/// @param options options
/// @param completion 完成回调
+ (void)openURL:(NSString*)urlStr options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options completionHandler:(void (^ __nullable)(BOOL success))completion;

/// 弹出APP评价页面
+(void)showAppReview API_AVAILABLE(ios(10.3));

/// 跳转到APP设置页面
+(void)openSetting;

/// 在APP中弹出App Store页面
/// @param appId AppId
+(void)showAppStoreInApp:(NSString *)appId fromVC:(UIViewController*)fromVC;

/// 在APP中弹出App Store页面
/// @param appId AppId
+(void)pushToAppStoreWithAppId:(NSString *)appId;
@end

NS_ASSUME_NONNULL_END
