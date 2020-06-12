//
//  NSData+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,AESOperation) {
    AESEncrypt = 0,
    AESDecrypt
};

typedef NS_ENUM(NSUInteger,AESKeySize) {
    KeySize128 = 0,
    KeySize192,
    KeySize256
};

NS_ASSUME_NONNULL_BEGIN

@interface NSData (LQCategory)
/// 将NSData 转为 字符串
@property(nonatomic,copy,readonly)NSString *string;

/// 将NSData 转为 字典
@property(nonatomic,strong,readonly)NSDictionary*json;


/// AES 加密
/// @param key key
/// @param iv 初始化向量(如果为nil则使用ECB，否则采用CBC)
/// @param operation 加密还是解密
-(NSData * _Nullable)aesEncryptWithKey:(NSString *)key ivStr:(NSString *)iv operation:(AESOperation)operation keySize:(AESKeySize)size;

/// AES 加密
/// @param keyData keyData
/// @param ivData 初始化向量(如果为nil则使用ECB，否则采用CBC)
/// @param operation 加密还是解密

-(NSData * _Nullable)aesEncryptWithKeyData:(NSData *)keyData ivData:(NSData *)ivData operation:(AESOperation)operation  keySize:(AESKeySize)size;
@end

NS_ASSUME_NONNULL_END
