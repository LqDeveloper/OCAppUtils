//
//  NSSet+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/8/31.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSSet<ObjectType> (LQCategory)
/// 遍历整个set
/// @param block 回调
- (void)bk_each:(void (^)(ObjectType obj))block;

/// 并发的遍历set
/// @param block 回调
- (void)bk_apply:(void (^)(ObjectType obj))block;

/// 遍历数组以查找与block匹配的第一个对象
/// @param block 回调
- (nullable id)bk_match:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找与block匹配的所有对象
/// @param block 回调
- (NSSet *)bk_select:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找与block不匹配的所有对象
/// @param block 回调
- (NSSet *)bk_reject:(BOOL (^)(ObjectType obj))block;

/// 将内部对象映射为其他类型
/// @param block 回调
- (NSSet *)bk_map:(id (^)(ObjectType obj))block;

/// 使用block累积任意对象。
/// @param initial 初始值
/// @param block 回调
- (nullable id)bk_reduce:(nullable id)initial withBlock:(__nullable id (^)(__nullable id sum, ObjectType obj))block;

/// 遍历数组以查找是否有任何对象与block匹配
/// @param block 回调
- (BOOL)bk_any:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找是否没有对象与块匹配
/// @param block 回调
- (BOOL)bk_none:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找是否所有对象都与块匹配
/// @param block 回调
- (BOOL)bk_all:(BOOL (^)(ObjectType obj))block;
@end

NS_ASSUME_NONNULL_END
