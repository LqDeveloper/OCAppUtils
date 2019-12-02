//
//  BaseCustomTableViewController.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCustomTableViewController<TableView:UITableView *> : BaseViewController<UITableViewDelegate,UITableViewDataSource>
-(instancetype)init:(UITableViewStyle)style;

@property(nonatomic,strong)TableView tableView;

/// 滚动开始 子类如果需要可以重写
-(void)tableViewBeginScroll;

/// 滚动结束 子类如果需要可以重写
-(void)tableViewEndScroll;

/// 用于设置TableView
- (void)configTableView;
@end

NS_ASSUME_NONNULL_END
