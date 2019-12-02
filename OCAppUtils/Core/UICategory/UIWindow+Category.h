//
//  UIWindow+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Category)
- (void)switchRootVCTo:(UIViewController *)toVC animated:(BOOL)animated duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
