//
//  NSURLRequest+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSURLRequest+LQCategory.h"

@implementation NSURLRequest (LQCategory)
+(NSURLRequest *)requestWithUrlStr:(NSString *)urlStr{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
}
@end
