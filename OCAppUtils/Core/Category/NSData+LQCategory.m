//
//  NSData+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSData+LQCategory.h"

@implementation NSData (LQCategory)
- (NSString *)string{
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)json{
    if ([NSJSONSerialization isValidJSONObject:self]) {return @{};}
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:nil];
}
@end
