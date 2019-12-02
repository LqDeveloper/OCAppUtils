//
//  NSDate+Category.h
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)
/// 当前日历
@property(nonatomic,strong,readonly)NSCalendar* calendar;
/// 时代
@property(nonatomic,assign,readonly)NSInteger era;
/// 季度
@property(nonatomic,assign,readonly)NSInteger quarter;
/// 今年的第几个星期
@property(nonatomic,assign,readonly)NSInteger weekOfYear;
/// 今年的第几个星期
@property(nonatomic,assign,readonly)NSInteger weekOfMonth;
/// 年份
@property(nonatomic,assign,readonly)NSInteger year;
/// 月份
@property(nonatomic,assign,readonly)NSInteger month;
/// 日期
@property(nonatomic,assign,readonly)NSInteger day;
/// 星期几
@property(nonatomic,assign,readonly)NSInteger weekday;
/// 小时
@property(nonatomic,assign,readonly)NSInteger hour;
/// 分钟
@property(nonatomic,assign,readonly)NSInteger minute;
/// 秒
@property(nonatomic,assign,readonly)NSInteger millisecond;
/// 纳秒
@property(nonatomic,assign,readonly)NSInteger nanosecond;
/// 获取当前 秒级 时间戳 - 10位
@property(nonatomic,assign,readonly)NSInteger secondStamp;
/// 获取当前 毫秒级 时间戳 - 13位
@property(nonatomic,assign,readonly)NSInteger milliSecondStamp;
/// 是否大于当前时间
@property(nonatomic,assign,readonly)BOOL isInFuture;
/// 是否小于当前时间
@property(nonatomic,assign,readonly)BOOL isInPast;
/// 检查时间是否在今天之内
@property(nonatomic,assign,readonly)BOOL isInToday;
/// 检查时间是否在昨天之内
@property(nonatomic,assign,readonly)BOOL isInYesterday;
/// 检查时间是否在明天之内
@property(nonatomic,assign,readonly)BOOL isInTomorrow;
/// 检查日期是否在周末时间内
@property(nonatomic,assign,readonly)BOOL isInWeekend;
/// 检查日期是否在工作日内
@property(nonatomic,assign,readonly)BOOL isWorkday;
/// 检查日期是否在当前星期内
@property(nonatomic,assign,readonly)BOOL isInCurrentWeek;
/// 检查日期是否在当前月份之内
@property(nonatomic,assign,readonly)BOOL isInCurrentMonth;
/// 检查日期是否在当前年份之内
@property(nonatomic,assign,readonly)BOOL isInCurrentYear;
/// 昨天的日期
@property(nonatomic,strong,readonly)NSDate *yesterday;
/// 明天的日期
@property(nonatomic,strong,readonly)NSDate *tomorrow;
/// UNIX 时间戳
@property(nonatomic,assign,readonly)NSTimeInterval unixTimestamp;
/// 将日期转为字符串 yyyy-MM-dd HH:mm:ss
@property(nonatomic,copy,readonly)NSString *dateString;

/// 时间格式化
/// @param format 例如：yyyy-MM-dd HH:mm:ss
-(NSString *)dateWithFormat:(NSString *)format;

/// 计算两个时间相差多少秒
/// @param other 另一个时间
-(NSInteger)secondsSince:(NSDate *)other;

/// 计算两个时间相差多少分钟
/// @param other 另一个时间
-(NSInteger)minutesSince:(NSDate *)other;

/// 计算两个时间相差多少小时
/// @param other 另一个时间
-(NSInteger)hoursSince:(NSDate *)other;

/// 计算两个时间相差多少天
/// @param other 另一个时间
-(NSInteger)daysSince:(NSDate *)other;

/// 是否在实际区间内
/// @param startDate 开始实际
/// @param endDate 结束时间
-(BOOL)isBetweenStartDate:(NSDate*)startDate endDate:(NSDate *)endDate;
@end

NS_ASSUME_NONNULL_END
