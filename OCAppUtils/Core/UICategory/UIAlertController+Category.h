//
//  UIAlertController+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Category)
- (void)addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *action))handler;

- (void)addTextField:(NSString *)text placeholder:(NSString *)placeholder valueChangedTarget:(nullable id)target valueChangedSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
