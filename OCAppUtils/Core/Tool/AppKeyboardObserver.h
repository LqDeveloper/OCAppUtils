//
//  AppKeyboardObserver.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AppKeyBoardObserverDelegate <NSObject>

/**
 键盘弹出
 
 @param height 键盘的高度
 @param showTime  键盘弹出动画时间
 */
-(void)keyboardShowWithHeight:(CGFloat)height andShowAnimationTime:(NSTimeInterval)showTime;

/**
 键盘收起
 
 @param hideTime  键盘弹出动画时间
 */
-(void)keyboardHideWithHideAnimationTime:(NSTimeInterval)hideTime;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AppKeyboardObserver : NSObject
@property(nonatomic,weak)id <AppKeyBoardObserverDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
