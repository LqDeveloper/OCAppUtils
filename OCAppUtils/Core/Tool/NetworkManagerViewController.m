//
//  NetworkManagerViewController.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NetworkManagerViewController.h"

@interface NetworkManagerViewController ()

@end

@implementation NetworkManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"网络环境管理";
    self.tableView.rowHeight = 60;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSave)];
}

-(void)clickBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickSave{
    if (self.saveBlock) {
        self.saveBlock(self.currentIndex);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCellTitles:(NSArray<NSString *> *)cellTitles{
    _cellTitles = cellTitles;
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitles[indexPath.row];
    if (self.currentIndex == indexPath.row){
        cell.detailTextLabel.text = @"选中";
    }else{
        cell.detailTextLabel.text = @"";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentIndex == indexPath.row) {
        return;
    }
    self.currentIndex = indexPath.row;
    if (self.selectItemBlock) {
        self.selectItemBlock(self.currentIndex);
    }
}

@end
