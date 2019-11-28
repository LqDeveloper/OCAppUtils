//
//  UIAlertController+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/28.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#import "UIAlertController+Category.h"

@implementation UIAlertController (Category)
- (void)addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction * _Nonnull))handler{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:handler];
    [self addAction:action];
}

- (void)addTextField:(NSString *)text placeholder:(NSString *)placeholder valueChangedTarget:(nullable id)target valueChangedSelector:(SEL)selector{
    [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = text;
        textField.placeholder = placeholder;
        [textField addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    }];
}
@end
