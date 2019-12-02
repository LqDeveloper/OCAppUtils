//
//  AppCountDownButton.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppCountDownButton;

NS_ASSUME_NONNULL_BEGIN
@protocol AppCountDownDelegate <NSObject>
-(void)clicCoundkDown:(AppCountDownButton*)btn;
-(void)beginCountDown:(AppCountDownButton*)btn count:(NSInteger)count;
-(void)countDowning:(AppCountDownButton*)btn remainSecond:(NSInteger)remainSecond;
-(void)countDownComplete:(AppCountDownButton*)btn;
@end
@interface AppCountDownButton : UIButton
@property(nonatomic,weak)id <AppCountDownDelegate> delegate;
@property(nonatomic,assign)NSInteger count;
- (instancetype)initWithCount:(NSInteger)count;
-(void)startCountDown;
-(void)stopCountDown;
@end

NS_ASSUME_NONNULL_END
