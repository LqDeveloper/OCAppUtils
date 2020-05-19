//
//  NSArray+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray <ObjectType> (LQCategory)
/// 数组是否为空
@property(nonatomic,assign,readonly)BOOL isEmpty;


/// 将内部对象映射为其他类型
/// @param block 回调函数
-(NSArray *)mapToOthers:(id(^)(ObjectType))block;

/// 遍历数组
/// @param block 回调函数
-(void)forEachObject:(void(^)(ObjectType))block;

/// 筛选
/// @param block 回调函数
-(NSArray<ObjectType>*)filterObject:(BOOL(^)(ObjectType))block;
@end

NS_ASSUME_NONNULL_END
