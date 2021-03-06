//
//  UITextField+LQCategory.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (LQCategory)
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
/// 是否包含中文
@property(nonatomic,assign,readonly)BOOL hasChinese;
/// 检查身份证号是否合法
@property(nonatomic,assign,readonly)BOOL hasValidID;
/// 左侧边距
@property(nonatomic,assign)CGFloat leftSpace;
/// 右侧边距
@property(nonatomic,assign)CGFloat rightSpace;
///移除开头和结尾的空格
@property(nonatomic,copy,readonly)NSString *trimmedText;

+(UITextField *)createTextField:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderColor:(UIColor *)phColor;

+(UITextField *)createTextField:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderColor:(UIColor *)phColor textAlignment:(NSTextAlignment)textAlignment;

-(void)setPlaceHodeer:(NSString *)placeholder color:(UIColor *)phColor;
@end

NS_ASSUME_NONNULL_END
