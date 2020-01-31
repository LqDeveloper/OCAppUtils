//
//  BaseViewController.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
/// 设置状态栏隐藏
/// @param hidden 是否隐藏
- (void)setupStatusBarHidden:(BOOL)hidden;
@end

NS_ASSUME_NONNULL_END
