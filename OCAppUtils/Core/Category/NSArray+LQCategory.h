//
//  NSArray+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 __covariant :子类型指针可以向父类型指针转换
 __contravariant:父类型指针可以向子类型转换
 __kindof修饰符:表示当前类或者子类
 */
@interface NSArray <ObjectType> (LQCategory)
/// 数组是否为空
@property(nonatomic,assign,readonly)BOOL isEmpty;
/// 反转数组
@property(nonatomic,copy,readonly)NSArray<ObjectType> *reverse;

/// 遍历数组
/// @param block 回调函数
-(void)bk_each:(void(^)(ObjectType obj))block;

/// 并发的遍历数组(执行的顺序不一定是所在的位置)
/// @param block 回调
-(void)bk_apply:(void(^)(ObjectType obj))block;

/// 遍历数组以查找与block匹配的第一个对象
/// @param block 回调
-(ObjectType)bk_match:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找与block匹配的所有对象
/// @param block 回调
- (NSArray<ObjectType> *)bk_select:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找与block不匹配的所有对象
/// @param block 回调
- (NSArray<ObjectType> *)bk_reject:(BOOL (^)(ObjectType obj))block;

/// 将内部对象映射为其他类型
/// @param block 回调
- (NSArray *)bk_map:(id (^)(ObjectType obj))block;

///行为类似于map，但是如果您在block中返回nil，则不会添加NSNull对象
/// @param block 回调
- (NSArray *)bk_compact:(id (^)(ObjectType obj))block;

/// 遍历数组以查找是否有任何对象与block匹配
/// @param block 回调
- (BOOL)bk_any:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找是否没有对象与块匹配
/// @param block 回调
- (BOOL)bk_none:(BOOL (^)(ObjectType obj))block;

/// 遍历数组以查找是否所有对象都与块匹配
/// @param block 回调
- (BOOL)bk_all:(BOOL (^)(ObjectType obj))block;


/// 根据块匹配测试此数组的每个元素是否与另一个数组的对应元素相关。
/// @param list 要比较的数组
/// @param block 比较方式
- (BOOL)bk_corresponds:(NSArray<ObjectType> *)list withBlock:(BOOL (^)(ObjectType obj1, ObjectType obj2))block;


/// 遍历数组将某个(NSInteger)属性进行累加
/// @param initial 初始值
/// @param block 回调
- (NSInteger)bk_reduceInteger:(NSInteger)initial withBlock:(NSInteger(^)(NSInteger result, ObjectType obj))block;

/// 遍历数组将某个(CGFloat)属性进行累加
/// @param initial 初始值
/// @param block 回调
- (CGFloat)bk_reduceFloat:(CGFloat)initial withBlock:(CGFloat(^)(CGFloat result, ObjectType obj))block;
@end

NS_ASSUME_NONNULL_END
