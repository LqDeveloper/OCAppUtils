//
//  NSURL+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSURL+LQCategory.h"

@implementation NSURL (LQCategory)
-(NSDictionary<NSString *,NSString *> *)queryParameters{
    NSURLComponents *components = [[NSURLComponents alloc]initWithURL:self resolvingAgainstBaseURL:NO];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSURLQueryItem *item in components.queryItems) {
        dic[item.name] = item.value;
    }
    return dic;
}

- (NSURL *)appendingQueryParameters:(NSDictionary<NSString *,NSString *> *)parameters{
    NSURLComponents *components = [[NSURLComponents alloc]initWithURL:self resolvingAgainstBaseURL:true];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:components.queryItems];
    for (NSString *key in parameters) {
        NSURLQueryItem *item = [[NSURLQueryItem alloc]initWithName:key value:parameters[key]];
        [arr addObject:item];
    }
    components.queryItems = arr;
    return components.URL;
}
@end
