//
//  BaseCustomTableViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "BaseCustomTableViewController.h"

@interface BaseCustomTableViewController ()
@property(nonatomic,assign)UITableViewStyle style;
@property(nonatomic,assign)BOOL isBeginScroll;
@property(nonatomic,assign)BOOL isInitState;
@end

@implementation BaseCustomTableViewController

- (instancetype)init:(UITableViewStyle)style{
    if (self = [super init]) {
        self.style = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:self.style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"OC_UITableViewCell"];
    }
    return _tableView;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OC_UITableViewCell" forIndexPath:indexPath];
    return cell;
}

@end
