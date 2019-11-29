//
//  NSString+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)
/// 字符串范围
@property(nonatomic,assign,readonly)NSRange range;
/// base64 解密
@property(nonatomic,copy,readonly)NSString *base64Decoded;
/// base64 加密
@property(nonatomic,copy,readonly)NSString *base64Encoded;
/// MD5 加密
@property(nonatomic,copy,readonly)NSString *md5;
/// 移除换行空格
@property(nonatomic,copy,readonly)NSString *removeSpace;
/// 是否包含字母
@property(nonatomic,assign,readonly)BOOL hasLetters;
/// 是否包含数字
@property(nonatomic,assign,readonly)BOOL hasNumber;
/// 是否包含中文
@property(nonatomic,assign,readonly)BOOL hasChinese;
/// 是否只包含字母
@property(nonatomic,assign,readonly)BOOL isOnlyLetter;
/// 是否包含最少一个字母和最少一个字母数字
@property(nonatomic,assign,readonly)BOOL isAlphaNumeric;
/// 是否为空
@property(nonatomic,assign,readonly)BOOL isEmpty;
/// 检查邮箱是否合法
@property(nonatomic,assign,readonly)BOOL hasValidEmail;
/// 检查手机号是否合法
@property(nonatomic,assign,readonly)BOOL hasValidPhoneNumber;
/// 检查邮政编码是否合法
@property(nonatomic,assign,readonly)BOOL hasValidPostalCode;
/// 检查IP是否合法
@property(nonatomic,assign,readonly)BOOL hasValidIPAddress;
/// 是否全是中文字符
@property(nonatomic,assign,readonly)BOOL isAllChinese;
/// 检查身份证号是否合法
@property(nonatomic,assign,readonly)BOOL hasValidID;
/// 判断Url是否合法
@property(nonatomic,assign,readonly)BOOL isValidUrl;
/// 判断是否是包含scheme的Url
@property(nonatomic,assign,readonly)BOOL isValidSchemedUrl;
/// 判断是否是合法的Https请求地址
@property(nonatomic,assign,readonly)BOOL isValidHttpsUrl;
/// 判断是否是合法的Http请求地址
@property(nonatomic,assign,readonly)BOOL isValidHttpUrl;
/// 判断是否是合法的文件路径
@property(nonatomic,assign,readonly)BOOL isValidFileUrl;
/// 检查字符串是否仅包含数字
@property(nonatomic,assign,readonly)BOOL isDigits;
/// 将字符串转为Bool
@property(nonatomic,assign,readonly)BOOL isTrue;
/// 将字符串转为日期  "yyyy-MM-dd"
@property(nonatomic,strong,readonly)NSDate *date;
/// 将字符串转为日期  "yyyy-MM-dd HH:mm:ss"
@property(nonatomic,strong,readonly)NSDate *dateTime;
/// 将字符串转为Url
@property(nonatomic,strong,readonly)NSURL *url;
/// 字符串开头和结尾没有空格或换行。
@property(nonatomic,copy,readonly)NSString *trimmed;
/// 将从url中获取的字符串解密
@property(nonatomic,copy,readonly)NSString *urlDecoded;
/// 将字符串编码成url可使用的字符串 url中不能有空格等特殊字符
@property(nonatomic,copy,readonly)NSString *urlEncoded;
/// 移除字符串中的空格和换行
@property(nonatomic,copy,readonly)NSString *withoutSpaces;

/// 将字符串转换成当地的float显示格式
-(void)floatToLocal:(NSLocale *)local;
/// 将字符串转换成当地的double显示格式
-(void)doubleToLocal:(NSLocale *)local;
///将字符串复制到全局粘贴板。
-(void)copyToPasteboard;
/// 将字符串转换成Date
-(NSDate *)dateWithFormat:(NSString *)format;
 ///从字符串中删除给定的前缀。
-(NSString *)removingPrefix:(NSString *)prefix;
///从字符串中删除给定的后缀。
-(NSString *)removingSuffix:(NSString *)suffix;

/// 计算字符串的size
/// @param size size
/// @param font 字体
- (CGSize)getSizeFromSize:(CGSize)size font:(UIFont *)font;
- (CGFloat)getHeightFromWidth:(CGFloat)width font:(UIFont *)font;
- (CGFloat)getWidthFromHeight:(CGFloat)height font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
