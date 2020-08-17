//
//  NSString+JLHDate.h
//  ZZH
//
//  Created by Gavin on 2019/6/14.
//  Copyright © 2019 zhoutong. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface NSString (JLHDate)
+(NSString *)dateDotStr:(NSString *)dateStr;
/**
 通过年月计算当月总共有多少天

 @param year 年
 @param month 月
 @return 天数
 */
+(NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month;
/**
 通过日期计算该日期所在月1号是周几

 @param date 日期
 @return 周几 0-6 （日-六）
 */
+(NSInteger)calculationThisMonthFirstDayInWeek:(NSDate *)date;

/**
 时间戳转时间
 
 @param form 转换后的时间格式  YYYY-MM-dd HH:mm:ss
 @param time 时间戳  如果外部的时间戳单位为毫秒  需自行 除以 1000
 @return 转换后的时间
 */
+(NSString *)getTimeFromTimestamp:(NSString *)form time:(double)time;
/**
 时间转时间戳
 
 @param form 转换前的时间格式  YYYY-MM-dd HH:mm:ss
 @param time 时间戳  如果外部的时间戳单位为毫秒  需自行 除以 1000
 @return 转换后的时间戳
 */
+(NSString *)getTimestampFromTime:(NSString *)form time:(NSString *)time;

@end

//NS_ASSUME_NONNULL_END
