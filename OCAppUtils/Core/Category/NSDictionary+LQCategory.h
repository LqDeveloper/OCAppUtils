//
//  NSDictionary+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType>(LQCategory)
/// 字典是否为空
@property(nonatomic,assign,readonly)BOOL isEmpty;

/// 将字典转为json字符串
@property(nonatomic,copy,readonly)NSString *jsonString;

/// 将字典转为json Data
@property(nonatomic,strong,readonly)NSData *jsonData;

/// 遍历字典
/// @param block 回调
- (void)bk_each:(void (^)(KeyType key, ObjectType obj))block;

/// 并发的遍历字典
/// @param block 回调
- (void)bk_apply:(void (^)(KeyType key, ObjectType obj))block;

/// 遍历字典以查找与该块匹配的第一个键/值对的value。
/// @param block 回调
- (ObjectType)bk_match:(BOOL (^)(KeyType key, ObjectType obj))block;

/// 遍历字典以查找与block匹配的键/值对。
/// @param block 回调
- (NSDictionary<KeyType, ObjectType> *)bk_select:(BOOL (^)(KeyType key, ObjectType obj))block;

/// 遍历字典以查找与block不匹配的键/值对。
/// @param block 回调
- (NSDictionary<KeyType, ObjectType> *)bk_reject:(BOOL (^)(KeyType key, ObjectType obj))block;


/// 将key对应的value映射成另外一个值
/// @param block 回调
- (NSDictionary<KeyType, id> *)bk_map:(id (^)(KeyType key, ObjectType obj))block;


/// 遍历字典以查找是否有任何键/值对与该块匹配。
/// @param block 回调
- (BOOL)bk_any:(BOOL (^)(KeyType key, ObjectType obj))block;


/// 遍历字典以查找是否没有键/值对匹配该块。
/// @param block 回调
- (BOOL)bk_none:(BOOL (^)(KeyType key, ObjectType obj))block;


/// 遍历字典以查找是否所有键/值对都与该块匹配。
/// @param block 回调
- (BOOL)bk_all:(BOOL (^)(KeyType key, ObjectType obj))block;

@end

NS_ASSUME_NONNULL_END
