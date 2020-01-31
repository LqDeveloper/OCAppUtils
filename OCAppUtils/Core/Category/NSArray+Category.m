//
//  NSArray+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)
- (BOOL)isEmpty{
    return self.count == 0;
}

-(NSArray *)mapToOthers:(id  _Nonnull (^)(id _Nonnull))block{
    if (!block||self.count == 0) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (id item in self) {
        [arr addObject:block(item)];
    }
    return arr;
}

-(void)forEachObject:(void (^)(id _Nonnull))block{
    if (!block||self.count == 0) {
        return;
    }
    for (id item in self) {
        block(item);
    }
}

-(NSArray *)filterObject:(BOOL (^)(id _Nonnull))block{
    if (!block||self.count == 0) {
        return self;
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (id item in self) {
        if (block(item)) {
            [arr addObject:item];
        }
    }
    return arr;
}

@end
