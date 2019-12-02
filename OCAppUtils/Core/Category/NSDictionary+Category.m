//
//  NSDictionary+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)
- (BOOL)isEmpty{
    return self.allKeys.count == 0;
}

- (NSString *)jsonString{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return @"";
    }
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSData *)jsonData{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSDictionary *)mapToOthers:(id  _Nonnull (^)(id _Nonnull, id _Nonnull))block{
    if (!block &&(self.allKeys.count == 0)) {
        return self;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *key in self) {
        id value = block(key,self[key]);
        dic[key] = value;
    }
    return dic.copy;
}

- (void)forEachObject:(void (^)(id _Nonnull, id _Nonnull))block{
    if (!block &&(self.allKeys.count == 0)) {
        return;
    }
    for (NSString *key in self) {
        block(key,self[key]);
    }
}

- (NSDictionary *)filterObject:(BOOL (^)(id _Nonnull, id _Nonnull))block{
    if (!block &&(self.allKeys.count == 0)) {
        return self;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *key in self) {
        if (block(key,self[key])) {
            dic[key] = self[key];
        }
    }
    return dic.copy;
}
@end
