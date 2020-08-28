//
//  NSMutableDictionary+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/8/28.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary<KeyType, ObjectType> (LQCategory)

/// 遍历字典以查找与block匹配的键/值对(会修改字典本身)
/// @param block 回调
- (void)bk_performSelect:(BOOL (^)(KeyType key, ObjectType obj))block;


/// 遍历字典以查找与block不匹配的键/值对。(会修改字典本身)
/// @param block 回调
- (void)bk_performReject:(BOOL (^)(KeyType key, ObjectType obj))block;


/// 将字典的value映射成其他对象(会修改字典本身)
/// @param block 回调
- (void)bk_performMap:(id (^)(KeyType key, ObjectType obj))block;

@end

NS_ASSUME_NONNULL_END
