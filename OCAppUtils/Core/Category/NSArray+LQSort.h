//
//  NSArray+LQSort.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/21.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,LQSortType) {
    ///选择排序
    SelectSort = 0,
    ///插入排序
    InsertSort,
    ///冒泡排序
    BubbleSort,
    ///希尔排序
    ShellSort,
    ///归并排序
    MergeSort
};
NS_ASSUME_NONNULL_BEGIN

@interface NSArray <ObjectType> (LQSort)

/// 对数组内容进行排序 第一个 < 第二个 为降序 第一个 > 第二个 为升序
/// @param type 排序算法
/// @param block 比较方式
-(NSArray<ObjectType>*)sortWithType:(LQSortType)type AndBlock: (BOOL(^)(ObjectType,ObjectType))block;

/// 使用冒泡算法对数组内容进行排序 第一个 < 第二个 为降序 第一个 > 第二个 为升序 
/// @param block 比较方式
-(NSArray<ObjectType>*)sort:(BOOL(^)(ObjectType,ObjectType))block;

/// 使用NSSortDescriptor根据keypath 排序 返回排序后的数组
/// @param key key
/// @param ascending 是否是升序
-(NSArray<ObjectType>*)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending;
@end

NS_ASSUME_NONNULL_END
