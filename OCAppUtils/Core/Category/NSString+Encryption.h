//
//  NSString+Encryption.h
//  OCAppUtils
//
//  Created by Quan Li on 2020/6/10.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)
/// MD5 加密 终端测试命令：md5 -s "string" ,提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。
@property(nonatomic,copy,readonly)NSString *md5;

/// SHA1散列(40个字符的SHA1散列字符串) 终端测试命令：echo -n "string" | openssl sha1
@property(nonatomic,copy,readonly)NSString *sha1;

/// SHA224散列(56个字符的SHA1散列字符串) 终端测试命令：echo -n "string" | openssl sha224
@property(nonatomic,copy,readonly)NSString *sha224;

/// SHA256散列(64个字符的SHA256散列字符串) 终端测试命令：echo -n "string" | openssl sha256
@property(nonatomic,copy,readonly)NSString *sha256;

/// SHA384散列(96个字符的SHA1散列字符串) 终端测试命令：echo -n "string" | openssl sha384
@property(nonatomic,copy,readonly)NSString *sha384;

/// SHA512散列(128个字符的SHA512散列字符串) 终端测试命令：echo -n "string" | openssl sha512
@property(nonatomic,copy,readonly)NSString *sha512;

/// 计算文件的MD5散列结果(32个字符的MD5散列字符串) 终端测试命令：md5 file.dat
@property(nonatomic,copy,readonly)NSString *fileMD5Hash;

/// 计算文件的SHA1散列结果(40个字符的SHA1散列字符串) 终端测试命令：openssl sha1 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA1Hash;

/// 计算文件的SHA224散列结果(56个字符的SHA1散列字符串) 终端测试命令：openssl sha224 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA224Hash;

/// 计算文件的SHA256散列结果(64个字符的SHA256散列字符串) 终端测试命令：openssl sha256 file.dat file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA256Hash;

/// 计算文件的SHA384散列结果(96个字符的SHA1散列字符串) 终端测试命令：openssl sha384 file.dat
@property(nonatomic,copy,readonly)NSString *fileSHA384Hash;

/// 计算文件的SHA512散列结果(128个字符的SHA512散列字符串) 终端测试命令：openssl sha512 file.dat 
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

/// 计算HMAC SHA224散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha224 -hmac "key"
/// 56个字符的HMAC SHA224散列字符串
/// @param key key
- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

/// 计算HMAC SHA256散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha256 -hmac "key"
/// 64个字符的HMAC SHA256散列字符串
/// @param key key
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/// 计算HMAC SHA384散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha384 -hmac "key"
/// 96个字符的HMAC SHA384散列字符串
/// @param key key
- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

/// 计算HMAC SHA512散列结果
/// 终端测试命令：echo -n "string" | openssl sha -sha512 -hmac "key"
/// 128个字符的HMAC SHA512散列字符串
/// @param key key
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
