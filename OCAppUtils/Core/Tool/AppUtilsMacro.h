//
//  AppUtilsMacro.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#ifndef AppUtilsMacro_h
#define AppUtilsMacro_h

//获取屏幕 宽度、高度
#define ScreenWidth  (AppDeviceInfo.screenWidth)
#define ScreenHeight (AppDeviceInfo.screenHeight)
#define NavigationHeight (AppDeviceInfo.navigationHeight)
#define TabBarHeight (AppDeviceInfo.tabBarHeight)
#define StatusBarHeight (AppDeviceInfo.statusBarHeight)
#define TopSpace (AppDeviceInfo.topSpace)
#define BottomSpace (AppDeviceInfo.bottomSpace)
//设备类型
#define IsPhone (AppDeviceInfo.isPhone)
#define IsPad   (AppDeviceInfo.isPad)
#define IsPhone5Series (AppDeviceInfo.isPhone5Series)
#define IsPhoneXSeries (AppDeviceInfo.isPhoneXSeries)


//Debug环境下输出信息
#ifdef DEBUG
#define AppLog(fmt,...) NSLog(@"%s [Line %d] " fmt, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define AppLog(...) {}
#endif

// 检测block是否可用并执行
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); }

//定义弱引用
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self
//定义强引用
#define StrongSelf(StrongSelf) __strong __typeof(weakSelf) StrongSelf = weakSelf
#endif /* AppUtilsMacro_h */
