//
//  ViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "ViewController.h"
#import "OCAppUtils.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * left= [UIButton buttonWithTitle:@"左边" titleColor:[UIColor redColor] backgroundColor:[UIColor greenColor] normalImage:@"image.jpg"];
    left.frame = CGRectMake(100, 100, 80, 80);
    [self.view addSubview:left];
    [left setImage:ImageLocationLeft space:10];
    UIButton * right= [UIButton buttonWithTitle:@"右边" titleColor:[UIColor redColor] backgroundColor:[UIColor yellowColor] normalImage:@"image.jpg"];
    right.frame = CGRectMake(100, 200, 80, 80);
    [self.view addSubview:right];
    [right setImage:ImageLocationRight space:10];

    UIButton * top = [UIButton buttonWithTitle:@"上边" titleColor:[UIColor redColor] backgroundColor:[UIColor cyanColor] normalImage:@"image.jpg"];
    top.frame = CGRectMake(100, 310, 80, 80);
    [self.view addSubview:top];
    [top setImage:ImageLocationTop space:10];

    UIButton * bottom= [UIButton buttonWithTitle:@"下边" titleColor:[UIColor redColor] backgroundColor:[UIColor orangeColor] normalImage:@"image.jpg"];
    bottom.frame = CGRectMake(100, 410, 80, 80);
    [self.view addSubview:bottom];
    [bottom setImage:ImageLocationBottom space:10];
    [bottom skt_setShadowWithColor:[UIColor blueColor] andAlpha:0.5 andX:0 andY:10 andBlur:40 andSpread:10];
    [bottom addTarget:self action:@selector(clicBtn) forControlEvents:UIControlEventTouchUpInside];
//    BOOL isTrue = NO;
//    lq_guard(isTrue)else{
//        NSLog(@"这是guard");
//    }
//
    
    NSArray<NSString *> *arr = @[@"4",@"2",@"5",@"1",@"3",@"6",@"8",@"7"];
    [arr forEachObject:^(NSString * _Nonnull item ) {
        NSLog(@"%@",item);
    }];
    
    NSString *str = @"这是啥";
    [str forEach:^(NSString * _Nonnull item) {
        NSLog(@"%@",item);
    }];
    
    NSArray *arr1 = [arr sortWithType:BubbleSort AndBlock:^BOOL(NSString * _Nonnull str1, NSString * _Nonnull str2) {
        NSInteger num1 = str1.integerValue;
        NSInteger num2 = str2.integerValue;
        return num1 < num2;
    }];
    NSLog(@"%@",arr1);
    
    [self checkNotificationEnable:^(BOOL isSuccess) {
        
    }];
}

-(void)clicBtn{
    if (@available(iOS 10.3, *)) {
           [self showAppReview];
       } else {
           // Fallback on earlier versions
       }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [UIApplication pushToitunesWithAppId:@"498354805"];
//    [self showAppStoreInApp:@"498354805"];
    if (@available(iOS 10.3, *)) {
        [UIApplication showAppReview];
    } else {
        // Fallback on earlier versions
    }
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
    AppLog(@"内存总容量:%lu",(unsigned long)AppDeviceInfo.volumeTotalCapacity);
    AppLog(@"可用内存容量:%lu",(unsigned long)AppDeviceInfo.volumeAvailableCapacity);
    
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

@end
