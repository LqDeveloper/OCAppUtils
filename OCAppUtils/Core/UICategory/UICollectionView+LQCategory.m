//
//  UICollectionView+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UICollectionView+LQCategory.h"

@implementation UICollectionView (LQCategory)

- (void)safeScrollToRow:(NSIndexPath *)indexPath scrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated{
    if (indexPath.item < 0 || indexPath.section < 0 || indexPath.section >= self.numberOfSections || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return;
    }
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

-(void)registerCellClass:(Class)cellClass{
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

-(void)registerCellNib:(UINib *)nib andClass:(Class)cellClass{
    [self registerNib:nib forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

-(UICollectionViewCell *)dequeueReusableCellWithCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath{
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

-(void)registerViewClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind{
    [self registerClass:viewClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:NSStringFromClass(viewClass)];
}

-(void)registerViewNib:(UINib *)nib forSupplementaryViewOfKind:(NSString *)kind andClass:(Class)viewClass{
    [self registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(viewClass)];
}

-(UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withClass:(Class)viewClass forIndexPath:(NSIndexPath *)indexPath{
    return [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:NSStringFromClass(viewClass) forIndexPath:indexPath];
}
@end
