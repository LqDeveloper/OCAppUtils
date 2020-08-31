//
//  NSObject+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/12/2.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSObject+LQCategory.h"
#import <objc/runtime.h>

@import ObjectiveC.runtime;

#pragma mark - Weak support

@interface WeakAssociatedObject : NSObject

@property (nonatomic, weak) id value;

@end

@implementation WeakAssociatedObject

@end



@implementation NSObject (LQCategory)
+ (NSString *)className{
    return NSStringFromClass([self class]);
}

+ (NSDictionary<NSString *,id> *)properties{
    // 获取当前类的所有属性
    unsigned int count;// 记录属性个数
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    
    return mArray.copy;
}

+ (NSArray<NSString *> *)mathods{
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++){
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        [mArray addObject:name];
    }
    return mArray.copy;
}


- (void)bk_associateValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)bk_atomicallyAssociateValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)bk_associateCopyOfValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)bk_atomicallyAssociateCopyOfValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY);
}

- (void)bk_weaklyAssociateValue:(__autoreleasing id)value withKey:(const void *)key{
    WeakAssociatedObject *assoc = objc_getAssociatedObject(self, key);
    if (!assoc) {
        assoc = [WeakAssociatedObject new];
        [self bk_associateValue:assoc withKey:key];
    }
    assoc.value = value;
}

- (id)bk_associatedValueForKey:(const void *)key{
    id value = objc_getAssociatedObject(self, key);
    if (value && [value isKindOfClass:[WeakAssociatedObject class]]) {
        return [(WeakAssociatedObject *)value value];
    }
    return value;
}

- (void)bk_removeAllAssociatedObjects{
    objc_removeAssociatedObjects(self);
}

#pragma mark - Class Methods

+ (void)bk_associateValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)bk_atomicallyAssociateValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

+ (void)bk_associateCopyOfValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)bk_atomicallyAssociateCopyOfValue:(id)value withKey:(const void *)key{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY);
}

+ (void)bk_weaklyAssociateValue:(__autoreleasing id)value withKey:(const void *)key{
    WeakAssociatedObject *assoc = objc_getAssociatedObject(self, key);
    if (!assoc) {
        assoc = [WeakAssociatedObject new];
        [self bk_associateValue:assoc withKey:key];
    }
    assoc.value = value;
}

+ (id)bk_associatedValueForKey:(const void *)key{
    id value = objc_getAssociatedObject(self, key);
    if (value && [value isKindOfClass:[WeakAssociatedObject class]]) {
        return [(WeakAssociatedObject *)value value];
    }
    return value;
}

+ (void)bk_removeAllAssociatedObjects{
    objc_removeAssociatedObjects(self);
}
@end
