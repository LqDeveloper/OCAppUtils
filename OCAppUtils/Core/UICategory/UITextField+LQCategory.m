//
//  UITextField+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "UITextField+LQCategory.h"

@implementation UITextField (LQCategory)
- (BOOL)isEmpty{
    return [self.text isEqualToString:@""];
}

- (BOOL)hasValidEmail{
    NSString *predicateStr = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)hasValidPhoneNumber{
    NSString *predicateStr = @"^((1[34578][0-9]{9})|((0\\d{2}-\\d{8})|(0\\d{3}-\\d{7,8})|(0\\d{10,11}))$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)hasValidPostalCode{
    NSString *predicateStr = @"^[0-8]\\d{5}(?!\\d)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)hasValidIPAddress{
    NSString *predicateStr = @"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)hasChinese{
    NSString *predicateStr = @"([\\s\\S]*)[\\u4e00-\\u9fa5]+([\\s\\S]*)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)isAllChinese{
    NSString *predicateStr = @"(^[\\u4e00-\\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}



- (BOOL)hasValidID{
    NSString *predicateStr = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|[xX])$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self.text];
}

- (void)setLeftSpace:(CGFloat)leftSpace{
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, leftSpace, self.frame.size.height)];
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (CGFloat)leftSpace{
    return self.leftView.frame.size.width;
}

- (void)setRightSpace:(CGFloat)rightSpace{
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rightSpace, self.frame.size.height)];
    self.rightViewMode = UITextFieldViewModeAlways;
}
- (CGFloat)rightSpace{
    return self.rightView.frame.size.width;
}


+ (UITextField *)createTextField:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderColor:(UIColor *)phColor{
    UITextField *textField = [[UITextField alloc]init];
    textField.textColor = textColor;
    textField.font = font;
    [textField setPlaceHodeer:placeholder color:phColor];
    return textField;
}

+ (UITextField *)createTextField:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder placeholderColor:(UIColor *)phColor textAlignment:(NSTextAlignment)textAlignment{
    UITextField *textField = [UITextField createTextField:textColor font:font placeholder:placeholder placeholderColor:phColor];
    textField.textAlignment = textAlignment;
    return textField;
}

- (void)setPlaceHodeer:(NSString *)placeholder color:(UIColor *)phColor{
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder attributes:@{NSForegroundColorAttributeName:phColor}];
}

- (NSString *)trimmedText{
    return [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
