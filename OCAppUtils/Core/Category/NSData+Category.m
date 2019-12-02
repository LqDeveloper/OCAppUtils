//
//  NSData+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSData+Category.h"

@implementation NSData (Category)
- (NSString *)string{
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)json{
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:nil];
}
@end
