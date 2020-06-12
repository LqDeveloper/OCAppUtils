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
    //81dc9bdb52d04dc20036dbd8313ed055
    NSLog(@"%@",@"1234".md5);
    //7110eda4d09e062aa5e4a390b0a572ac0d2c0220
    NSLog(@"%@",@"1234".sha1);
    //99fb2f48c6af4761f904fc85f95eb56190e5d40b1f44ec3a9c1fa319
    NSLog(@"%@",@"1234".sha224);
    //03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4
    NSLog(@"%@",@"1234".sha256);
    //504f008c8fcf8b2ed5dfcde752fc5464ab8ba064215d9c5b5fc486af3d9ab8c81b14785180d2ad7cee1ab792ad44798c
    NSLog(@"%@",@"1234".sha384);
    //d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db
    NSLog(@"%@",@"1234".sha512);
    NSLog(@"------------------------------");
    //966ae92d2e266068411f135706ab4d9e
    NSLog(@"%@",[@"1234" hmacMD5StringWithKey:@"key"]);
    //02dc09676d62a47018fbfb645cd9a27e27c5e283
    NSLog(@"%@",[@"1234" hmacSHA1StringWithKey:@"key"]);
    //ca2b2f3411f154dbd1a0179860b1aeef9ee9072f064a5a319d86685b
    NSLog(@"%@",[@"1234" hmacSHA224StringWithKey:@"key"]);
    //280ed91eee6eb96a2b1cf598843c1308e84623d14e4208d96c20f7e2de81315e
    NSLog(@"%@",[@"1234" hmacSHA256StringWithKey:@"key"]);
    //682ef474a442069c734a885a7e4ffca6994a99a914ceea86cac63572edcdbc22fc477e9b8d7e4505fa52d840639d5c43
    NSLog(@"%@",[@"1234" hmacSHA384StringWithKey:@"key"]);
    //5d7ea93e116204a673674f9458d42bade8c85896fce87ff267ca52b8b2088d5c49799192856150c9a2e76db44917571c0e2848003d7702c78b232a0ba2dd654c
    NSLog(@"%@",[@"1234" hmacSHA512StringWithKey:@"key"]);
    NSLog(@"------------------------------");
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    //4a55abbdf6a269329f9a8d262d2fa49
    NSLog(@"%@",path.fileMD5Hash);
    //6e6772a6d7700be44a128f884c8344e1ea628757
    NSLog(@"%@",path.fileSHA1Hash);
    //febe0f87a752e78390bc98e1fb96bfa3bb59a62c58ffaeffedcc460a
    NSLog(@"%@",path.fileSHA224Hash);
    //a5f8bf4dfbd93077821a7776343fb0eec248b5edd7788989e36d75ebbc53db54
    NSLog(@"%@",path.fileSHA256Hash);
    //abcb6d29ee717d3c5c29263b69d71c59b772815a8003ff2253eaf07535ea57933e29080694d5bbb6accc5285445ec773
    NSLog(@"%@",path.fileSHA384Hash);
    //21a171aed9c537b227e1c542ba10d347192ac468d8eedfadd9d3dc35661167406ef852dfc06cd961567cc5d3ce659ed91dc4e4a9ede262e003be13abe3022265
    NSLog(@"%@",path.fileSHA512Hash);
    NSString *encryt = [@"1234" aesEncryptWithKeyString:@"key" iv:nil];
    NSLog(@"%@",encryt);
    NSLog(@"%@",[encryt aesDecryptWithKeyString:@"key" iv:nil]);
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
