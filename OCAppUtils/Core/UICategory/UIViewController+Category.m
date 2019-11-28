//
//  UIViewController+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "UIViewController+Category.h"

IB_DESIGNABLE
@implementation UIViewController (Category)
- (void)setPopGestureEnable:(BOOL)popGestureEnable{
    self.navigationController.interactivePopGestureRecognizer.enabled = popGestureEnable;
}
- (BOOL)popGestureEnable{
    return self.navigationController.interactivePopGestureRecognizer.isEnabled;
}

- (BOOL)isVisible{
    return self.isViewLoaded && (self.view.window != nil);
}

- (void)setNormalImage:(UIImage *)normalImage{
    self.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UIImage *)normalImage{
    return self.tabBarItem.image;
}

- (void)setSelectImage:(UIImage *)selectImage{
    self.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UIImage *)selectImage{
    return self.tabBarItem.selectedImage;
}

- (void)setTabTitle:(NSString *)tabTitle{
    self.tabBarItem.title = tabTitle;
}
- (NSString *)tabTitle{
    return self.tabBarItem.title;
}

- (void)setNavigationBarHiden:(BOOL)navigationBarHiden{
    self.navigationController.navigationBarHidden = navigationBarHiden;
}
- (BOOL)navigationBarHiden{
    return self.navigationController.isNavigationBarHidden;
}

- (void)showAlert:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle cancleBlock:(void (^)(void))cancleCallBack okTitle:(NSString *)okTitle okBlock:(void (^)(void))okCallBack{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancleCallBack) {
            cancleCallBack();
        }
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (okCallBack) {
            okCallBack();
        }
    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)showAlert:(NSString *)title message:(NSString *)message okTitle:(NSString *)okTitle okBlock:(void (^)(void))okCallBack{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (okCallBack) {
            okCallBack();
        }
    }];
    
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}
@end
