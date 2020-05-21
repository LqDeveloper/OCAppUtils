//
//  NSArray+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 __covariant :子类型指针可以向父类型指针转换
 __contravariant:父类型指针可以向子类型转换
 __kindof修饰符:表示当前类或者子类
 */
@interface NSArray <__covariant ObjectType> (LQCategory)
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
