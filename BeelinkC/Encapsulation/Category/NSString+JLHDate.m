//
//  NSString+JLHDate.m
//  ZZH
//
//  Created by Gavin on 2019/6/14.
//  Copyright © 2019 zhoutong. All rights reserved.
//

#import "NSString+JLHDate.h"

@implementation NSString (JLHDate)

+(NSString *)dateDotStr:(NSString *)dateStr{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *date=[dateFormatter dateFromString:dateStr];
    NSDateFormatter *newDateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [newDateFormatter setDateFormat:@"yyyy.MM.dd"];
    return [newDateFormatter stringFromDate:date];
}

+(NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            return 30;
        }
        case 2:{
            if (isrunNian) {
                return 29;
            }else{
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}
+(NSInteger)calculationThisMonthFirstDayInWeek:(NSDate *)date;{
    //    if (isEmpty(date)) {
    date = [NSDate date];
    //    }
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * comps = [[NSDateComponents alloc] init];
    NSDateComponents * theComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear;
    comps = [calendar components:unitFlags fromDate:date];
    theComps = [calendar components:unitFlags fromDate:[NSDate date]];
    //    NSInteger theMonth = [theComps month];// 本月的月份
    NSUInteger day = [comps day];// 是本月第几天
    //    NSInteger todayInMonth = day;
    //    NSString *dateStr = [[self showDateFormatter] stringFromDate:date];
    //    NSString *todayStr = [dateFormatter stringFromDate:[NSDate date]];
    if (day > 1) {// 如果不是本月第一天
        // 将日期推算到本月第一天
        NSInteger hours = (day - 1) * -24;
        date = [NSDate dateWithTimeInterval:hours * 60 * 60 sinceDate:date];
    }
    comps = [calendar components:unitFlags fromDate:date];
    //    dayInWeek = [comps weekday] - 1;// 是周几
    NSLog(@"周几%ld",[comps weekday] - 1);
    return [comps weekday] - 1;
    //    0-6
    //    周日-周六
    //    NSInteger year = [comps year];// 公历年
    //    NSInteger month = [comps month];// 公里月
    //    if ([dateStr isEqualToString:todayStr]) {
    //        NSLog(@"%ld",(long)day + dayInWeek - 2);
    //    }
}
+(NSString *)getTimeFromTimestamp:(NSString *)form time:(double)time{
    if (time == 0) {
        return @"";
    }
    //将对象类型的时间转换为NSDate类型
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:time];
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:form];
    NSString *timeStr = [formatter stringFromDate:myDate];
    return timeStr;
}
+(NSString *)getTimestampFromTime:(NSString *)form time:(NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:form];
    NSDate* date = [formatter dateFromString:time];
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]*1000] integerValue];
    NSString *timeStr = [NSString stringWithFormat:@"%ld",(long)timeSp];
    return [timeStr isEqualToString:@"0"] ? @"":timeStr;
}
@end
