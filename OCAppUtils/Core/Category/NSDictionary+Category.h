//
//  NSDictionary+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType>(Category)
/// 字典是否为空
@property(nonatomic,assign,readonly)BOOL isEmpty;

/// 将字典转为json字符串
@property(nonatomic,copy,readonly)NSString *jsonString;

/// 将字典转为json Data
@property(nonatomic,strong,readonly)NSData *jsonData;

/// 将内部对象映射为其他类型
/// @param block 回调函数
-(NSDictionary *)mapToOthers:(id(^)(KeyType,ObjectType))block;

/// 遍历字典
/// @param block 回调函数
-(void)forEachObject:(void(^)(KeyType,ObjectType))block;

/// 筛选
/// @param block 回调函数
-(NSDictionary<KeyType,ObjectType>*)filterObject:(BOOL(^)(KeyType,ObjectType))block;
@end

NS_ASSUME_NONNULL_END
