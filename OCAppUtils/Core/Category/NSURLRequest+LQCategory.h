//
//  NSURLRequest+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (LQCategory)
+(NSURLRequest *)requestWithUrlStr:(NSString *)urlStr;
@end

NS_ASSUME_NONNULL_END
