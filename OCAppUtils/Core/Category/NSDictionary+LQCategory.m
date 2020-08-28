//
//  NSDictionary+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSDictionary+LQCategory.h"

@implementation NSDictionary (LQCategory)
- (BOOL)isEmpty{
    return self.allKeys.count == 0;
}

- (NSString *)jsonString{
    if (![NSJSONSerialization isValidJSONObject:self]) {return @"";}
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {return @"";}
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSData *)jsonData{
    if (![NSJSONSerialization isValidJSONObject:self]) {return nil;}
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (void)bk_each:(void (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (void)bk_apply:(void (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    [self enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (id)bk_match:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    return self[[[self keysOfEntriesPassingTest:^(id key, id obj, BOOL *stop) {
        if (block(key, obj)) {
            *stop = YES;
            return YES;
        }
        return NO;
    }] anyObject]];
}

- (NSDictionary *)bk_select:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSArray *keys = [[self keysOfEntriesPassingTest:^(id key, id obj, BOOL *stop) {
        return block(key, obj);
    }] allObjects];
    NSArray *objects = [self objectsForKeys:keys notFoundMarker:[NSNull null]];
    return [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}

- (NSDictionary *)bk_reject:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    return [self bk_select:^BOOL(id key, id obj) {
        return !block(key, obj);
    }];
}

- (NSDictionary *)bk_map:(id  _Nonnull (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self bk_each:^(id key, id obj) {
        id value = block(key, obj) ?: [NSNull null];
        result[key] = value;
    }];
    return result;
}

- (BOOL)bk_any:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    return [self bk_match:block] != nil;
}

- (BOOL)bk_none:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    return [self bk_match:block] == nil;
}

- (BOOL)bk_all:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    NSParameterAssert(block != nil);
    __block BOOL result = YES;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!block(key, obj)) {
            result = NO;
            *stop = YES;
        }
    }];
    return result;
}

@end
