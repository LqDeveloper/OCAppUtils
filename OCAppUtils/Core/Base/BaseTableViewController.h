//
//  BaseTableViewController.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UITableViewController
/// 设置状态栏隐藏
/// @param hidden 是否隐藏
- (void)setupStatusBarHidden:(BOOL)hidden;

/// 滚动开始 子类如果需要可以重写
-(void)tableViewBeginScroll;

/// 滚动结束 子类如果需要可以重写
-(void)tableViewEndScroll;

/// 用于设置TableView
- (void)configTableView;
@end

NS_ASSUME_NONNULL_END
