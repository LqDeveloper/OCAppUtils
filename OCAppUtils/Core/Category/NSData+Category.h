//
//  NSData+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Category)
/// 将NSData 转为 字符串
@property(nonatomic,copy,readonly)NSString *string;

/// 将NSData 转为 字典
@property(nonatomic,strong,readonly)NSDictionary*json;
@end

NS_ASSUME_NONNULL_END
