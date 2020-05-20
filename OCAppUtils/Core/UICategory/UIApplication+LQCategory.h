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
@end

NS_ASSUME_NONNULL_END
