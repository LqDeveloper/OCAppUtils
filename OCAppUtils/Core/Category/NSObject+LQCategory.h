//
//  NSObject+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/12/2.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LQCategory)
/// 获取类名
+ (NSString *)className;

/// 获取属性列表
+ (NSDictionary<NSString *,id> *)properties;

/// 获取方法列表
+ (NSArray<NSString *> *)mathods;
@end

NS_ASSUME_NONNULL_END
