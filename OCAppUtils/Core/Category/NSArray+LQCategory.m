//
//  NSArray+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSArray+LQCategory.h"

@implementation NSArray (LQCategory)
- (BOOL)isEmpty{
    return self.count == 0;
}

- (NSArray *)reverse{
    return [[self reverseObjectEnumerator]allObjects];
}


-(void)bk_each:(void (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)bk_apply:(void (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (id)bk_match:(BOOL (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSUInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];
    
    if (index == NSNotFound)
        return nil;
    
    return self[index];
}

- (NSArray *)bk_select:(BOOL (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }]];
}

- (NSArray *)bk_reject:(BOOL (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    return [self bk_select:^BOOL(id obj) {
        return !block(obj);
    }];
}


- (NSArray *)bk_map:(id  _Nonnull (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        [result addObject:value];
    }];
    return result;
}

- (NSArray *)bk_compact:(id  _Nullable (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj);
        if(value)
            {
            [result addObject:value];
            }
    }];
    return result;
}

- (BOOL)bk_any:(BOOL (^)(id _Nonnull))block{
    return [self bk_match:block] != nil;
}

- (BOOL)bk_none:(BOOL (^)(id _Nonnull))block{
    return [self bk_match:block] == nil;
}

- (BOOL)bk_all:(BOOL (^)(id _Nonnull))block{
    NSParameterAssert(block != nil);
    __block BOOL result = YES;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (!block(obj)) {
            result = NO;
            *stop = YES;
        }
    }];
    return result;
}

- (BOOL)bk_corresponds:(NSArray *)list withBlock:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    __block BOOL result = NO;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx < list.count) {
            id obj2 = list[idx];
            result = block(obj, obj2);
        } else {
            result = NO;
        }
        *stop = !result;
    }];
    return result;
}

- (NSInteger)bk_reduceInteger:(NSInteger)initial withBlock:(NSInteger (^)(NSInteger, id _Nonnull))block{
    NSParameterAssert(block != nil);
    __block NSInteger result = initial;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = block(result, obj);
    }];
    return result;
}

- (CGFloat)bk_reduceFloat:(CGFloat)initial withBlock:(CGFloat (^)(CGFloat, id _Nonnull))block{
    NSParameterAssert(block != nil);
    __block CGFloat result = initial;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = block(result, obj);
    }];
    return result;
}
@end
