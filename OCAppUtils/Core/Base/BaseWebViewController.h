//
//  BaseWebViewController.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : BaseViewController<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *webView;

-(void)loadUrlStr:(nullable NSString *)urlStr;
-(void)loadHtml:(nullable NSString *) htmlStr baseUrl:(nullable NSString *)baseUrl;
@end

NS_ASSUME_NONNULL_END
