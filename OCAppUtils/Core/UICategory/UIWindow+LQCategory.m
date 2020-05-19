//
//  UIWindow+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIWindow+LQCategory.h"
@implementation UIWindow (LQCategory)
- (void)switchRootVCTo:(UIViewController *)toVC animated:(BOOL)animated duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(void))completion{
    
    if (!animated) {
        self.rootViewController = toVC;
        if (completion) {
            completion();
        }
        return;
    }
    
    [UIView transitionWithView:self duration:duration options:options animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:false];
        self.rootViewController = toVC;
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
    
}
@end
