//
//  BaseWebViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.frame = self.view.bounds;
    [self.view addSubview:self.webView];
}

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)loadUrlStr:(NSString *)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)loadHtml:(NSString *)htmlStr baseUrl:(nullable NSString *)baseUrl{
    NSURL *base = [NSURL URLWithString:baseUrl];
    [self.webView loadHTMLString:htmlStr baseURL:base];
}

@end
