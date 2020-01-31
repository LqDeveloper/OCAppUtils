//
//  UIApplication+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UIApplication+Category.h"

@implementation UIApplication (Category)
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
@end
