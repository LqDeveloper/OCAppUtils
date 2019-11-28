//
//  AppViewProtocol.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppViewProtocol <NSObject>
@optional
-(void)app_addViews;
-(void)app_makeLayout;
-(void)app_setupNavigation;
-(void)app_adaptDevice;
-(void)app_requestData;
-(void)app_registerNotifications;
-(void)app_removeNotifications;
-(void)app_bindViewModel;
-(void)app_bindEvent;
@end

NS_ASSUME_NONNULL_END
