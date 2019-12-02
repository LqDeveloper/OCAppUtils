//
//  AppCountDownButton.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "AppCountDownButton.h"
@interface AppCountDownButton()
@property(nonatomic,assign)NSInteger remainCount;
@property(nonatomic,assign)NSTimer *countTimer;

@end
@implementation AppCountDownButton
- (instancetype)init{
    if (self = [super init]) {
        [self addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithCount:(NSInteger)count{
    if (self = [super init]) {
        self.count = count;
    }
    return self;
}

- (void)setCount:(NSInteger)count{
    _count = count;
    _remainCount = count;
}

-(void)clickBtn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clicCoundkDown:)]) {
        [self.delegate clicCoundkDown:self];
    }
}

-(void)startCountDown{
    if (self.countTimer != nil) {
        return;
    }
    self.countTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    self.enabled = NO;
    if (self.delegate && [self.delegate respondsToSelector:@selector(beginCountDown:count:)]) {
        [self.delegate beginCountDown:self count:self.remainCount];
    }
    [[NSRunLoop currentRunLoop]addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}

-(void)timerRun{
    if (self.remainCount == 1) {
        [self stopCountDown];
        if (self.delegate && [self.delegate respondsToSelector:@selector(countDownComplete:)]) {
            [self.delegate countDownComplete:self];
        }
    }else{
        self.remainCount -= 1;
        if (self.delegate && [self.delegate respondsToSelector:@selector(countDowning:remainSecond:)]) {
            [self.delegate countDowning:self remainSecond:self.remainCount];
        }
    }
}

-(void)stopCountDown{
    if (self.countTimer == nil) {
        return;
    }
    self.enabled = YES;
    self.remainCount = self.count;
    [self.countTimer invalidate];
    self.countTimer = nil;
}
@end

