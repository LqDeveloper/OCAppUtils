//
//  UICollectionView+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Category)
-(void)safeScrollToRow:(NSIndexPath *)indexPath scrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated;

-(void)registerCellClass:(Class)cellClass;
-(void)registerCellNib:(UINib *)nib andClass:(Class)cellClass;
-(UICollectionViewCell *)dequeueReusableCellWithCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

-(void)registerViewClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind;
-(void)registerViewNib:(UINib *)nib forSupplementaryViewOfKind:(NSString *)kind andClass:(Class)viewClass;
-(UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withClass:(Class)viewClass forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
