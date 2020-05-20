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
/// @param message 标题
/// @param okTitle 确认按钮标题
/// @param okCallBack 确认回调
- (void)showAlert:(NSString *)title message:(NSString *)message okTitle:(NSString *)okTitle okBlock:(void(^)(void))okCallBack;
@end

NS_ASSUME_NONNULL_END
