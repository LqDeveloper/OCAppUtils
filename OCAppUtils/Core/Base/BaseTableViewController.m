//
//  BaseTableViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
@property(nonatomic,assign)BOOL isHidden;
@property(nonatomic,assign)BOOL isBeginScroll;
@property(nonatomic,assign)BOOL isInitState;
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)setupStatusBarHidden:(BOOL)hidden{
    self.isHidden = hidden;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden{
    return self.isHidden;
}

- (void)tableViewBeginScroll{}
- (void)tableViewEndScroll{}
- (void)configTableView{}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.isInitState) {
        return;
    }
    if (self.isBeginScroll) {
        return;
    }
    self.isBeginScroll = YES;
    [self tableViewBeginScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (!self.isBeginScroll) {
        return;
    }
    self.isBeginScroll = NO;
    [self tableViewEndScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (!self.isInitState) {
        self.isInitState = YES;
    }
    if (self.isBeginScroll) {
        return;
    }
    self.isBeginScroll = YES;
    [self tableViewBeginScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!self.isBeginScroll) {
        return;
    }
    if (decelerate) {
        return;
    }
    self.isBeginScroll = NO;
    [self tableViewEndScroll];
}
@end
