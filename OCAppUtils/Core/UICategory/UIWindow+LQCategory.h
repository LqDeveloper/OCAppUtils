//
//  UIWindow+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (LQCategory)

/// 切换rootViewController
/// @param toVC 切换到的VC
/// @param animated 是否动画
/// @param duration 切换时间
/// @param options 动画类型
/// @param completion 完成回调
- (void)switchRootVCTo:(UIViewController *)toVC animated:(BOOL)animated duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
