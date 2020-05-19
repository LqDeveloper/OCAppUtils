//
//  NSString+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSString+LQCategory.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (LQCategory)
- (CGSize)getSizeFromSize:(CGSize)size font:(UIFont *)font{
    return[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (CGFloat)getHeightFromWidth:(CGFloat)width font:(UIFont *)font{
    return [self getSizeFromSize:CGSizeMake(width, 0) font:font].height;
}

- (CGFloat)getWidthFromHeight:(CGFloat)height font:(UIFont *)font{
    return [self getSizeFromSize:CGSizeMake(0, height) font:font].width;
}

- (NSRange)range{
    return  NSMakeRange(0, self.length);
}

- (NSData *)data{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

-(NSDictionary *)json{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

-(NSString *)base64Decoded{
    NSData *data =  [[NSData alloc]initWithBase64EncodedString:self options:0];
    return  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)base64Encoded{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)md5{
    // OC 字符串转换位C字符串
    const char *cStr = [self UTF8String];
    // 16位加密
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    // 1: 需要加密的C字符串
    // 2: 加密的字符串的长度
    // 3: 加密长度
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02X", digest[i]];
    }
    return result;
}

-(NSString *)removeSpace{
    NSString *str = [NSString stringWithString:self];
    if ([str containsString:@" "]) {
        str =  [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }else if ([str containsString:@"\n"]){
        str =  [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return str;
}

- (NSString *)trimmedText{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)hasLetters{
    NSRange range = [self rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet] options:NSNumericSearch range:self.range];
    if (range.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)hasNumber{
    NSRange range = [self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet] options:NSLiteralSearch range:self.range];
    if (range.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)hasChinese{
    NSString *predicateStr = @"([\\s\\S]*)[\\u4e00-\\u9fa5]+([\\s\\S]*)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isOnlyLetter{
    NSString *predicateStr = @"^[a-zA-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

-(BOOL)isAlphaNumeric{
    BOOL hasLetters = [self hasLetters];
    BOOL hasNumber = [self hasNumber];
    //根据字母和数字进行分割，判断数组是否为空，从而判断是否包含其他字符
    NSArray *comps = [self componentsSeparatedByCharactersInSet:[NSCharacterSet alphanumericCharacterSet]];
    return (comps.count == 0)&&hasLetters&&hasNumber;
}

- (BOOL)isEmpty{
    return [self isEqualToString:@""];
}

- (BOOL)hasValidEmail{
    NSString *predicateStr = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasValidPhoneNumber{
    NSString *predicateStr = @"^((1[34578][0-9]{9})|((0\\d{2}-\\d{8})|(0\\d{3}-\\d{7,8})|(0\\d{10,11}))$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasValidPostalCode{
    NSString *predicateStr = @"^[0-8]\\d{5}(?!\\d)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasValidIPAddress{
    NSString *predicateStr = @"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isAllChinese{
    NSString *predicateStr = @"(^[\\u4e00-\\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasValidID{
    NSString *predicateStr = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|[xX])$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidUrl{
    if ([NSURL URLWithString:self]) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidSchemedUrl{
    NSURL *url = [NSURL URLWithString:self];
    if ((url != nil) && (url.scheme != nil) ) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidHttpUrl{
    NSURL *url = [NSURL URLWithString:self];
    if ((url != nil) && [url.scheme isEqualToString:@"http"]) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidHttpsUrl{
    NSURL *url = [NSURL URLWithString:self];
    if ((url != nil) && [url.scheme isEqualToString:@"https"]) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidFileUrl{
    if ([NSURL URLWithString:self].isFileURL) {
        return YES;
    }
    return NO;
}


- (BOOL)isDigits{
    return [[NSCharacterSet decimalDigitCharacterSet]isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:self]];
}

- (BOOL)isTrue{
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([str isEqualToString:@"true"]||[str isEqualToString:@"yes"]||[str isEqualToString:@"1"]) {
        return YES;
    }else if ([str isEqualToString:@"false"]||[str isEqualToString:@"no"]||[str isEqualToString:@"0"]) {
        return NO;
    }
    return NO;
}

- (NSDate *)date{
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter dateFromString:str];
}

- (NSDate *)dateTime{
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter dateFromString:str];
}

- (NSURL *)url{
    return [NSURL URLWithString:self];
}

- (NSString *)urlDecoded{
    return [self stringByRemovingPercentEncoding];
}

- (NSString *)urlEncoded{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
}

- (CGFloat)floatToLocal:(NSLocale *)local{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.locale = local;
    formatter.allowsFloats = YES;
    return [formatter numberFromString:self].floatValue;
}

- (void)copyToPasteboard{
    [UIPasteboard generalPasteboard].string = self;
}

- (NSDate *)dateWithFormat:(NSString *)format{
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = format;
    return [formatter dateFromString:str];
}

- (NSDictionary<NSString *,NSString *> *)queryParameters{
    NSURLComponents *components = [[NSURLComponents alloc]initWithString:self];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSURLQueryItem *item in components.queryItems) {
        dic[item.name] = item.value;
    }
    return dic;
}

- (BOOL)predicateWith:(NSString *)predicateStr{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

+ (BOOL)predicateWith:(NSString *)predicateStr withObject:(NSString *)obj{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:obj];
}

@end
