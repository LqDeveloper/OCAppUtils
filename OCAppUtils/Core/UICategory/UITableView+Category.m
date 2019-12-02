//
//  UITableView+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UITableView+Category.h"

@implementation UITableView (Category)
-(void)scrollToTop:(BOOL)animated{
    [self setContentOffset:CGPointZero animated:animated];
}

- (void)scrollToBottom:(BOOL)animated{
    CGPoint bottom = CGPointMake(0, self.contentSize.height - self.bounds.size.height);
    [self setContentOffset:bottom animated:animated];
}

- (void)safeScrollToRow:(NSIndexPath *)indexPath scrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated{
    if (indexPath.row < 0 || indexPath.section < 0 ||indexPath.section >= self.numberOfSections||indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return;
    }
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}


-(void)registerCellClass:(Class)cellClass{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellNib:(UINib *)nib andClass:(Class)cellClass{
    [self registerNib:nib forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

-(UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

- (UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath{
    return  [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

- (void)registerHeaderFooterViewClass:(Class)headerFooterClass{
    [self registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterClass)];
}

- (void)registerHeaderFooterViewNib:(UINib *)nib andClass:(Class)headerFooterClass{
    [self registerNib:nib forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterClass)];
}

-(UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithClass:(Class)headerFooterClass{
    return [self dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerFooterClass)];
}
@end
