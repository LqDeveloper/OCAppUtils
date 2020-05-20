//
//  NSAttributedString+LQCategory.m
//  OCAppUtils
//
//  Created by Quan Li on 2020/5/20.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

#import "NSAttributedString+LQCategory.h"

@implementation NSAttributedString (LQCategory)
-(NSAttributedString *)appendAttributeStr:(NSAttributedString *)attri{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]init];
    [str appendAttributeStr:self];
    [str appendAttributeStr:attri];
    return  [attri copy];
}
@end
