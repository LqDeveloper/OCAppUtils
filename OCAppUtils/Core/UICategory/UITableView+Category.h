//
//  UITableView+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Category)
-(void)scrollToTop:(BOOL)animated;
-(void)scrollToBottom:(BOOL)animated;
-(void)safeScrollToRow:(NSIndexPath *)indexPath scrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

-(void)registerCellClass:(Class)cellClass;
-(void)registerCellNib:(UINib *)nib andClass:(Class)cellClass;
-(UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass;
-(UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

-(void)registerHeaderFooterViewClass:(Class)headerFooterClass ;
-(void)registerHeaderFooterViewNib:(UINib *)nib andClass:(Class)headerFooterClass;
-(UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithClass:(Class)headerFooterClass;
@end

NS_ASSUME_NONNULL_END
