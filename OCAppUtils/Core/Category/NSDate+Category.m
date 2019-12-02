//
//  NSDate+Category.m
//  OCAppUtils
//
//  Created by Quan Li on 2019/11/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#import "NSDate+Category.h"
@implementation NSDate (Category)
-(NSCalendar *)calendar{
    return [[NSCalendar alloc]initWithCalendarIdentifier:[NSCalendar currentCalendar].calendarIdentifier];
}

- (NSInteger)era{
    return [self.calendar component:NSCalendarUnitEra fromDate:self];
}

-(NSInteger)year{
    return [self.calendar component:NSCalendarUnitYear fromDate:self];
}

- (NSInteger)quarter{
    return  [self.calendar component:NSCalendarUnitQuarter fromDate:self];
}

- (NSInteger)month{
    return [self.calendar component:NSCalendarUnitMonth fromDate:self];
}


- (NSInteger)weekOfYear{
    return [self.calendar component:NSCalendarUnitWeekOfYear fromDate:self];
}

- (NSInteger)weekOfMonth{
    return [self.calendar component:NSCalendarUnitWeekOfMonth fromDate:self];
}

- (NSInteger)day{
    return [self.calendar component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)weekday{
    return [self.calendar component:NSCalendarUnitWeekday fromDate:self];
}

- (NSInteger)hour{
    return [self.calendar component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)minute{
    return [self.calendar component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)second{
    return [self.calendar component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)nanosecond{
    return [self.calendar component:NSCalendarUnitNanosecond fromDate:self];
}

- (NSInteger)secondStamp{
    return [self timeIntervalSince1970];
}

- (NSInteger)milliSecondStamp{
    return [self timeIntervalSince1970]*1000;
}

- (BOOL)isInFuture{
    return [self compare:[NSDate date]] == NSOrderedDescending;
}

- (BOOL)isInPast{
    return [self compare:[NSDate date]] == NSOrderedAscending;
}

- (BOOL)isInToday{
    return [self.calendar isDateInToday:self];
}

- (BOOL)isInYesterday{
    return [self.calendar isDateInYesterday:self];
}

- (BOOL)isInTomorrow{
    return [self.calendar isDateInTomorrow: self];
}

- (BOOL)isInWeekend{
    return [self.calendar isDateInWeekend:self];
}

- (BOOL)isWorkday{
    return ![self.calendar isDateInWeekend:self];
}

- (BOOL)isInCurrentWeek{
    return [self.calendar isDate:self equalToDate:[NSDate date] toUnitGranularity:NSCalendarUnitWeekOfYear];
}

- (BOOL)isInCurrentMonth{
    return [self.calendar isDate:self equalToDate:[NSDate date] toUnitGranularity:NSCalendarUnitMonth];
}

- (BOOL)isInCurrentYear{
    return [self.calendar isDate:self equalToDate:[NSDate date] toUnitGranularity:NSCalendarUnitYear];
}

- (NSDate *)yesterday{
    return [self.calendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:self options:0];
}

- (NSDate *)tomorrow{
    return [self.calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self options:0];
}

- (NSTimeInterval)unixTimestamp{
    return [self timeIntervalSince1970];
}

- (NSString *)dateString{
    return [self dateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)dateWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSInteger)secondsSince:(NSDate *)other{
    return [self timeIntervalSinceDate:other];
}

- (NSInteger)minutesSince:(NSDate *)other{
    return [self timeIntervalSinceDate:other]/60;
}

-(NSInteger)hoursSince:(NSDate *)other{
    return [self timeIntervalSinceDate:other]/3600;
}

- (NSInteger)daysSince:(NSDate *)other{
    return [self timeIntervalSinceDate:other]/(3600*24);
}

- (BOOL)isBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate{
    NSComparisonResult result1 =  [startDate compare:self];
    NSComparisonResult result2 =  [endDate compare:self];
    if (result1 == NSOrderedAscending && result2 == NSOrderedDescending) {
        return YES;
    }
    return NO;
}

@end
