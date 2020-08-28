//
//  NSMutableArray+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2020/8/28.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import "NSMutableArray+LQCategory.h"

@implementation NSMutableArray (LQCategory)
- (void)bk_performSelect:(BOOL (^)(id _Nonnull))block {
    NSParameterAssert(block != nil);
    NSIndexSet *list = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return !block(obj);
    }];
    if (!list.count) return;
    [self removeObjectsAtIndexes:list];
}

- (void)bk_performReject:(BOOL (^)(id _Nonnull))block {
    NSParameterAssert(block != nil);
    return [self bk_performSelect:^BOOL(id obj) {
        return !block(obj);
    }];
}

- (void)bk_performMap:(id  _Nonnull (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSMutableArray *new = [self mutableCopy];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        if ([value isEqual:obj]) return;
        new[idx] = value;
    }];
    
    [self setArray:new];
}




@end
