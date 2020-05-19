//
//  AppDeviceInfo.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "AppDeviceInfo.h"
#import <sys/utsname.h>
@implementation AppDeviceInfo
+ (BOOL)isDebug{
#ifdef DEBUG
    return YES;
#endif
    return NO;
}

+ (BOOL)isPhone{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isPad{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}


+(BOOL)isPhoneXSeries{
    if (@available(iOS 11.0,*)) {
        return UIApplication.sharedApplication.windows[0].safeAreaInsets.bottom > 0;
    }else{
        return NO;
    }
}

+ (BOOL)isPhone5Series{
    return [UIScreen mainScreen].bounds.size.width < 375;
}

+ (CGFloat)screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)navigationHeight{
    if ([self isPhoneXSeries]) {
        return 88.0;
    }else{
        return 64.0;
    }
}

+ (CGFloat)tabBarHeight{
    if ([self isPhoneXSeries]) {
        return 83.0;
    }else{
        return 49.0;
    }
}

+(CGFloat)statusBarHeight{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)topSpace{
    if (@available(iOS 11.0,*)) {
        return UIApplication.sharedApplication.windows[0].safeAreaInsets.top;
    }else{
        return 0;
    }
}

+ (CGFloat)bottomSpace{
    if (@available(iOS 11.0,*)) {
        return UIApplication.sharedApplication.windows[0].safeAreaInsets.bottom;
    }else{
        return 0;
    }
}

+ (NSString *)appName{
    return [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleName"];
}

+ (NSString *)name{
    return [UIDevice currentDevice].name;
}

+ (NSString *)model{
    return [UIDevice currentDevice].model;
}

+ (NSString *)localizedModel{
    return [UIDevice currentDevice].localizedModel;
}

+(CGFloat)screenBrightness{
    return UIScreen.mainScreen.brightness;
}

+ (void)changeScreenBrightness:(CGFloat)brightness{
    UIScreen.mainScreen.brightness = brightness;
}

+ (NSString *)appVersion{
    return [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildVersion{
    return [[[NSBundle mainBundle] infoDictionary]objectForKey:(NSString *)kCFBundleVersionKey];
}

+ (NSString *)systemName{
    return UIDevice.currentDevice.systemName;
}

+ (NSString *)systemVersion{
    return UIDevice.currentDevice.systemVersion;
}

+ (NSString *)hardwareString{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

+ (NSString *)uuid{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString * uuid  = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    CFRelease(uuidRef);
    return uuid;
}

+ (NSString *)countryCode{
    return  [[NSLocale currentLocale]objectForKey:NSLocaleCountryCode];
}

+ (NSString *)bundleId{
    return NSBundle.mainBundle.bundleIdentifier;
}

+ (NSString *)documentPath{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)cachePath{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)rootPath{
    return NSHomeDirectory();
}

+ (NSUInteger)volumeTotalCapacity{
    NSURL *rootURL = [NSURL fileURLWithPath:[self rootPath]];//(nonnull NSArray<NSURLResourceKey> *)
    return (NSUInteger)[rootURL resourceValuesForKeys:@[NSURLVolumeTotalCapacityKey] error:nil][NSURLVolumeTotalCapacityKey];
}

+ (NSUInteger)volumeAvailableCapacity{
    NSURL *rootURL = [NSURL fileURLWithPath:[self rootPath]];//(nonnull NSArray<NSURLResourceKey> *)
    return (NSUInteger)[rootURL resourceValuesForKeys:@[NSURLVolumeAvailableCapacityKey] error:nil][NSURLVolumeAvailableCapacityKey];
}
@end
