//
//  NSObject+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/12/2.
//  Copyright © 2019 Quan Li. All rights reserved.
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

/// 给对象添加强引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,retain)
/// @param value 关联的值
/// @param key key
- (void)bk_associateValue:(nullable id)value withKey:(const void *)key;

/// 给类添加强引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,retain)
/// @param value 关联的值
/// @param key key
+ (void)bk_associateValue:(nullable id)value withKey:(const void *)key;

/// 给对象添加强引用关联值( NSObject的Objective-C对象派生类) property(atomic,retain)
/// @param value 关联的值
/// @param key key
- (void)bk_atomicallyAssociateValue:(nullable id)value withKey:(const void *)key;

/// 给类添加强引用关联值( NSObject的Objective-C对象派生类) property(atomic,retain)
/// @param value 关联的值
/// @param key key
+ (void)bk_atomicallyAssociateValue:(nullable id)value withKey:(const void *)key;

/// 给对象添加强引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,copy)
/// @param value 关联的值
/// @param key key
- (void)bk_associateCopyOfValue:(nullable id)value withKey:(const void *)key;

/// 给类添加强引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,copy)
/// @param value 关联的值
/// @param key key
+ (void)bk_associateCopyOfValue:(nullable id)value withKey:(const void *)key;

/// 给对象添加强引用关联值( NSObject的Objective-C对象派生类) property(atomic,copy)
/// @param value 关联的值
/// @param key key
- (void)bk_atomicallyAssociateCopyOfValue:(nullable id)value withKey:(const void *)key;

/// 给类添加强引用关联值( NSObject的Objective-C对象派生类) property(atomic,copy)
/// @param value 关联的值
/// @param key key
+ (void)bk_atomicallyAssociateCopyOfValue:(nullable id)value withKey:(const void *)key;

/// 给对象添加弱引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,weak)
/// @param value 关联的值
/// @param key key
- (void)bk_weaklyAssociateValue:(nullable __autoreleasing id)value withKey:(const void *)key;


/// 给类添加弱引用关联值( NSObject的Objective-C对象派生类) property(nonatomic,weak)
/// @param value 关联的值
/// @param key key
+ (void)bk_weaklyAssociateValue:(nullable __autoreleasing id)value withKey:(const void *)key;

/// 返回关联的值
/// @param key key
- (nullable id)bk_associatedValueForKey:(const void *)key;

/// 返回关联的值
/// @param key key
+ (nullable id)bk_associatedValueForKey:(const void *)key;

/// 删除所有关联的对象，并在必要时释放它们
- (void)bk_removeAllAssociatedObjects;

/// 删除所有关联的对象，并在必要时释放它们
+ (void)bk_removeAllAssociatedObjects;

@end

NS_ASSUME_NONNULL_END
