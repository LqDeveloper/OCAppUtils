//
//  AppTabBarViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// 设置TabBarItem的颜色，解决了iOS13导致的返回颜色失效的问题
/// @param color 颜色
/// @param state 状态
- (void)setTabBarItemColor:(UIColor *)color state:(UIControlState)state{
    if (@available(iOS 13.0,*)) {
        UITabBarAppearance *appearance = [[UITabBarAppearance alloc]initWithBarAppearance:self.tabBar.standardAppearance];
        
        if (state == UIControlStateNormal) {
            NSMutableDictionary<NSAttributedStringKey, id> * normal = appearance. stackedLayoutAppearance.normal.titleTextAttributes.mutableCopy;
            normal[NSForegroundColorAttributeName] = color;
            appearance. stackedLayoutAppearance.normal.titleTextAttributes = normal;
        }else if (state == UIControlStateSelected) {
            NSMutableDictionary<NSAttributedStringKey, id> * selected = appearance. stackedLayoutAppearance.selected.titleTextAttributes.mutableCopy;
            selected[NSForegroundColorAttributeName] = color;
            appearance. stackedLayoutAppearance.normal.titleTextAttributes = selected;
        }
        self.tabBar.standardAppearance = appearance;
    }else{
        NSMutableDictionary<NSAttributedStringKey, id> * attribute = [[UITabBarItem appearance] titleTextAttributesForState:state].mutableCopy;
        attribute[NSForegroundColorAttributeName] = color;
        [[UITabBarItem appearance]setTitleTextAttributes:attribute forState:UIControlStateSelected];
    }
}


- (BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return self.selectedViewController.preferredInterfaceOrientationForPresentation;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.selectedViewController.supportedInterfaceOrientations;
}


- (BOOL)prefersStatusBarHidden{
    return self.selectedViewController.prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.selectedViewController.preferredStatusBarStyle;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return self.selectedViewController.preferredStatusBarUpdateAnimation;
}


@end
