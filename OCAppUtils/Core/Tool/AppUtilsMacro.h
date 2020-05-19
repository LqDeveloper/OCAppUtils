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
#define SafeBlock(block, ...) if (block) { block(__VA_ARGS__); }


//定义弱引用
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self
//定义强引用
#define StrongSelf(StrongSelf) __strong __typeof(weakSelf) StrongSelf = weakSelf

//Swift 中的guard
#define Guard(__wish__) if (__wish__);

//字符串是否为空或者为nil
#define StringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空或者为nil
#define ArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空或者为nil
#define DictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//发送通知
#define PostNotification(name,obj,info) [[NSNotificationCenter defaultCenter]postNotificationName:name object:obj userInfo:info]

//加载xib
#define LoadNib(nibName) [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]]

//加载图片
#define GetImageWithName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//粗体
#define BoldFont(x) [UIFont boldSystemFontOfSize:x]
//正常字体
#define SystemFont(x) [UIFont systemFontOfSize:x]

//RGB格式
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//RGBA格式
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//当前系统语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//GCD - 只执行一次
#define DISPATCH_ONCE(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#endif /* AppUtilsMacro_h */
