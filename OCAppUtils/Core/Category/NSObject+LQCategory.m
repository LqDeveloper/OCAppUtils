//
//  NSObject+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/12/2.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSObject+LQCategory.h"
#import <objc/runtime.h>
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

@end
