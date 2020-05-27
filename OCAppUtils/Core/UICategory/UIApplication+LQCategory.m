//
//  UIApplication+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIApplication+LQCategory.h"
#import <StoreKit/StoreKit.h>
#import <UserNotifications/UserNotifications.h>
@implementation UIApplication (LQCategory)
+ (void)openURL:(NSString*)urlStr options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options completionHandler:(void (^ __nullable)(BOOL success))completion{
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        if (@available(iOS 10.0,*)) {
            [[UIApplication sharedApplication]openURL:url options:options completionHandler:completion];
        }else{
            [[UIApplication sharedApplication]openURL:url];
        }
    }
}

+(void)showAppReview {
    [SKStoreReviewController requestReview];
}


+(void)openSetting{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        if (@available(iOS 10.0,*)) {
            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
        }else{
            [[UIApplication sharedApplication]openURL:url];
        }
    }
}

+(void)showAppStoreInApp:(NSString *)appId fromVC:(nonnull UIViewController *)fromVC{
    SKStoreProductViewController *vc = [[SKStoreProductViewController alloc] init];
    __weak typeof(vc) weakVC = vc;
    __weak typeof(fromVC) weakSelf = fromVC;
    [vc loadProductWithParameters:
     @{SKStoreProductParameterITunesItemIdentifier : appId} completionBlock:^(BOOL result, NSError *error) {
        if(!error){
            [weakSelf presentViewController:weakVC animated:YES completion:nil];
        }
    }];
}


+(void)pushToAppStoreWithAppId:(NSString *)appId{
    NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",appId];
    [UIApplication openURL:urlStr options:@{} completionHandler:nil];
}

+(void)checkNotificationEnable:(void (^)(BOOL))completion{
    if (@available(iOS 10.0,*)) {
        [[UNUserNotificationCenter currentNotificationCenter]getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
                completion(YES);
            }else{
                completion(NO);
            }
        }];
    }else{
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        completion((UIUserNotificationTypeNone == setting.types) ? NO : YES);
    }
}
@end
