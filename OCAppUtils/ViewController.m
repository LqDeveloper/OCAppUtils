//
//  ViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "ViewController.h"
#import "OCAppUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppLog(@"%f",ScreenWidth);
    AppLog(@"%f",ScreenHeight);
    AppLog(@"%f",NavigationHeight);
    AppLog(@"%f",StatusBarHeight);
    AppLog(@"%f",TabBarHeight);
    AppLog(@"%f",TopSpace);
    AppLog(@"%f",BottomSpace);
    AppLog(@"%f",ScreenHeight);
    
    AppLog(@"%d",IsPhone);
    AppLog(@"%d",IsPad);
    AppLog(@"%d",IsPhone5Series);
    AppLog(@"%d",IsPhoneXSeries);
}

-(void)printDeviceInfo{
    AppLog(@"是否是Debug环境:%d",AppDeviceInfo.isDebug);
    AppLog(@"是否是手机:%d",AppDeviceInfo.isPhone);
    AppLog(@"是否是平板:%d",AppDeviceInfo.isPad);
    AppLog(@"是否是iPone5系列:%d",AppDeviceInfo.isPhone5Series);
    AppLog(@"是否是iPoneX系列:%d",AppDeviceInfo.isPhoneXSeries);
    AppLog(@"屏幕宽:%f",AppDeviceInfo.screenWidth);
    AppLog(@"屏幕高:%f",AppDeviceInfo.screenHeight);
    AppLog(@"导航高度:%f",AppDeviceInfo.navigationHeight);
    AppLog(@"tabbar高度:%f",AppDeviceInfo.tabBarHeight);
    AppLog(@"状态栏高度:%f",AppDeviceInfo.statusBarHeight);
    AppLog(@"安全区域头部高度:%f",AppDeviceInfo.topSpace);
    AppLog(@"安全区域头部底度:%f",AppDeviceInfo.bottomSpace);
    AppLog(@"应用名称:%@",AppDeviceInfo.appName);
    AppLog(@"手机用户名:%@",AppDeviceInfo.name);
    AppLog(@"设备机型名字:%@",AppDeviceInfo.model);
    AppLog(@"设备机型名字:%@",AppDeviceInfo.localizedModel);
    AppLog(@"屏幕亮度:%f",AppDeviceInfo.screenBrightness);
    AppLog(@"应用版本:%@",AppDeviceInfo.appVersion);
    AppLog(@"构建版本:%@",AppDeviceInfo.buildVersion);
    AppLog(@"系统名称:%@",AppDeviceInfo.systemName);
    AppLog(@"系统版本:%@",AppDeviceInfo.systemVersion);
    AppLog(@"设备型号:%@",AppDeviceInfo.hardwareString);
    AppLog(@"UUID:%@",AppDeviceInfo.uuid);
    AppLog(@"国家码:%@",AppDeviceInfo.countryCode);
    AppLog(@"BundleID:%@",AppDeviceInfo.bundleId);
    AppLog(@"沙盒下Document文件夹下的路径:%@",AppDeviceInfo.documentPath);
    AppLog(@"沙盒下Cache文件夹下的路径:%@",AppDeviceInfo.cachePath);
    AppLog(@"沙盒路径:%@",AppDeviceInfo.rootPath);
    AppLog(@"内存总容量:%ld",AppDeviceInfo.volumeTotalCapacity);
    AppLog(@"可用内存容量:%ld",AppDeviceInfo.volumeAvailableCapacity);
}

@end
