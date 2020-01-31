//
//  NSURLRequest+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSURLRequest+Category.h"

@implementation NSURLRequest (Category)
+(NSURLRequest *)requestWithUrlStr:(NSString *)urlStr{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
}
@end
