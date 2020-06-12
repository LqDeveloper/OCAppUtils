//
//  NSData+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSData+LQCategory.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSData (LQCategory)
- (NSString *)string{
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)json{
    if ([NSJSONSerialization isValidJSONObject:self]) {return @{};}
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:nil];
}

- (NSData *)aesEncryptWithKey:(NSString *)key ivStr:(NSString *)iv operation:(AESOperation)operation keySize:(AESKeySize)size{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [key dataUsingEncoding:NSUTF8StringEncoding];
    return [self aesEncryptWithKeyData:keyData ivData:ivData operation:operation keySize:size];
}

- (NSData *)aesEncryptWithKeyData:(NSData *)keyData ivData:(NSData *)ivData operation:(AESOperation)operation keySize:(AESKeySize)size{
    // 设置秘钥
    int blockSize = kCCBlockSizeAES128;
    int keySize = kCCKeySizeAES128;
    switch (size) {
        case KeySize128:
            keySize = kCCKeySizeAES128;
            break;
        case KeySize192:
            keySize = kCCKeySizeAES192;
            break;
        case KeySize256:
            keySize = kCCKeySizeAES256;
            break;
    }
    
    uint8_t cKey[keySize];
    bzero(cKey, sizeof(cKey));
    [keyData getBytes:cKey length:keySize];
    
    // 设置iv
    uint8_t cIv[blockSize];
    bzero(cIv, blockSize);
    int option = 0;
    if (ivData) {
        [ivData getBytes:cIv length:blockSize];
        option = kCCOptionPKCS7Padding;
    } else {
        option = kCCOptionPKCS7Padding | kCCOptionECBMode;
    }
    
    // 设置输出缓冲区
    size_t bufferSize = [self length] + blockSize;
    void *buffer = malloc(bufferSize);
    
    // 开始加密
    size_t encryptedSize = 0;
    //加密解密都是它 -- CCCrypt
    CCCryptorStatus cryptStatus = CCCrypt(operation == AESEncrypt ? kCCEncrypt : kCCDecrypt,
                                          kCCAlgorithmAES,
                                          option,
                                          cKey,
                                          keySize,
                                          cIv,
                                          [self bytes],
                                          [self length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    
    NSData *result = nil;
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
        return result;
    } else {
        free(buffer);
        NSLog(@"[错误] 加密失败|状态编码: %d", cryptStatus);
        return nil;
    }
}

@end
