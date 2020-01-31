//
//  NetworkManagerViewController.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "BaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManagerViewController : BaseTableViewController
@property(nonatomic,copy)NSArray<NSString *> *cellTitles;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,copy)void(^selectItemBlock)(NSInteger);
@property(nonatomic,copy)void(^saveBlock)(NSInteger);
@end

NS_ASSUME_NONNULL_END
