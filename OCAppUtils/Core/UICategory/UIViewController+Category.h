//
//  UIViewController+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Category)
@property(nonatomic,assign)IBInspectable BOOL popGestureEnable;
@property(nonatomic,assign,readonly)BOOL isVisible;
@property(nonatomic,strong)IBInspectable UIImage *normalImage;
@property(nonatomic,strong)IBInspectable UIImage *selectImage;
@property(nonatomic,copy)IBInspectable NSString *tabTitle;
@property(nonatomic,assign)IBInspectable BOOL navigationBarHiden;

- (void)showAlert:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle cancleBlock:(void(^)(void)) cancleCallBack okTitle:(NSString *)okTitle okBlock:(void(^)(void))okCallBack;

- (void)showAlert:(NSString *)title message:(NSString *)message okTitle:(NSString *)okTitle okBlock:(void(^)(void))okCallBack;
@end

NS_ASSUME_NONNULL_END
