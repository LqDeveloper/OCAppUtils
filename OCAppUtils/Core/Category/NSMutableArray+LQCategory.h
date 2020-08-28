//
//  NSMutableArray+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/8/28.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray<ObjectType> (LQCategory)

/// 遍历数组以查找与block匹配的所有对象(会修改数组本身)
/// @param block 回调
- (void)bk_performSelect:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找与block不匹配的所有对象(会修改数组本身)
/// @param block 回调
- (void)bk_performReject:(BOOL (^)(ObjectType obj))block;

/// 将数组中的对象映射成其他对象(会修改数组本身)
/// @param block 回调
- (void)bk_performMap:(id (^)(ObjectType obj))block;
@end

NS_ASSUME_NONNULL_END
