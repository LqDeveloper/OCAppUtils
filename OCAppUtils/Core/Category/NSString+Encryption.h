//
//  NSString+Encryption.h
//  OCAppUtils
//
//  Created by liquan on 2020/6/10.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)
/// base64 反编码
@property(nonatomic,copy,readonly)NSString *base64Decoded;
/// base64 编码
@property(nonatomic,copy,readonly)NSString *base64Encoded;

/// MD5 加密 终端测试命令：md5 -s "string" ,提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。
@property(nonatomic,copy,readonly)NSString *md5;

/// SHA1散列(40个字符的SHA1散列字符串) 终端测试命令：echo -n "string" | openssl sha -sha1
@property(nonatomic,copy,readonly)NSString *sha1;

/// SHA256散列(64个字符的SHA256散列字符串) 终端测试命令：echo -n "string" | openssl sha -sha256
@property(nonatomic,copy,readonly)NSString *sha256;

/// 512散列(128个字符的SHA 512散列字符串) 终端测试命令：echo -n "string" | openssl sha -sha512
@property(nonatomic,copy,readonly)NSString *sha512;

/// 计算文件的MD5散列结果(32个字符的MD5散列字符串) 终端测试命令：md5 file.dat
@property(nonatomic,copy,readonly)NSString *fileMD5Hash;

/// 计算文件的SHA1散列结果(40个字符的SHA1散列字符串) 终端测试命令：openssl sha -sha1 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA1Hash;

/// 计算文件的SHA256散列结果(64个字符的SHA256散列字符串) 终端测试命令：openssl sha -sha256 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA256Hash;

/// 计算文件的SHA512散列结果(128个字符的SHA512散列字符串) 终端测试命令：openssl sha -sha512 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA512Hash;

/// 计算HMAC MD5散列结果
/// 终端测试命令：echo -n "string" | openssl dgst -md5 -hmac "key"
/// 32个字符的HMAC MD5散列字符串
/// @param key key
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/// 计算HMAC SHA1散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha1 -hmac "key"
/// 40个字符的HMAC SHA1散列字符串
/// @param key key
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/// 计算HMAC SHA256散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha256 -hmac "key"
/// 64个字符的HMAC SHA256散列字符串
/// @param key key
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/// 计算HMAC SHA512散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha512 -hmac "key"
/// 128个字符的HMAC SHA512散列字符串
/// @param key key
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
