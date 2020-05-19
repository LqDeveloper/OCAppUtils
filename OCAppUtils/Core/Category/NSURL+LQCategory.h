//
//  NSURL+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (LQCategory)
/// 获取GET请求中的参数
@property(nonatomic,strong,readonly)NSDictionary<NSString*,NSString*>*queryParameters;
/// url 添加Get参数 返回新的NSURL
/// @param parameters 参数
-(NSURL*)appendingQueryParameters:(NSDictionary<NSString *,NSString*>*)parameters;
@end

NS_ASSUME_NONNULL_END
