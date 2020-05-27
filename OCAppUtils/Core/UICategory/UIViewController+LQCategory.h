//
//  UIViewController+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LQCategory)
/// 侧滑返回手势是否关闭
@property(nonatomic,assign)IBInspectable BOOL popGestureEnable;
/// 是否可见
@property(nonatomic,assign,readonly)BOOL isVisible;
/// 设置tabBarItem的normal状态图片
@property(nonatomic,strong)IBInspectable UIImage *normalImage;
/// 设置tabBarItem的select状态图片
@property(nonatomic,strong)IBInspectable UIImage *selectImage;
/// 设置tabBarItem的标题
@property(nonatomic,copy)IBInspectable NSString *tabTitle;
/// 是否隐藏导航
@property(nonatomic,assign)IBInspectable BOOL navigationBarHiden;

/// 显示alert
/// @param title 标题
/// @param message 描述
/// @param cancleTitle 取消按钮标题
/// @param cancleCallBack 取消回调
/// @param okTitle 确认按钮标题
/// @param okCallBack 确认回调
- (void)showAlert:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle cancleBlock:(void(^)(void)) cancleCallBack okTitle:(NSString *)okTitle okBlock:(void(^)(void))okCallBack;

/// 显示alert
/// @param title 标题
/// @param message 描述
/// @param okTitle 确认按钮标题
/// @param okCallBack 确认回调
- (void)showAlert:(NSString *)title message:(NSString *)message okTitle:(NSString *)okTitle okBlock:(void(^)(void))okCallBack;

/// 显示alert
/// @param title 标题
/// @param message 描述
/// @param actions UIAlertAction数组
- (void)showAlert:(NSString *)title message:(NSString *)message andActions:(NSArray<UIAlertAction*>*)actions;

/// 弹出APP评价页面
-(void)showAppReview API_AVAILABLE(ios(10.3));

/// 跳转到APP设置页面
-(void)openSetting;

/// 在APP中弹出App Store页面
/// @param appId AppId
-(void)showAppStoreInApp:(NSString *)appId;

/// 在APP中弹出App Store页面
/// @param appId AppId
-(void)pushToAppStoreWithAppId:(NSString *)appId;

/// 判断推送是否打开
/// @param completion 回调
-(void)checkNotificationEnable:(void (^)(BOOL))completion;
@end

NS_ASSUME_NONNULL_END
