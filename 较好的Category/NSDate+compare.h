//
//  NSDate+compare.h
//
//  Created by FLY on 2017/10/20.
//  Copyright © 2017年 FLY. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const kDateFormatterTypeFull   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeLong   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeMore   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeMiddle ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeShort  ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeLess   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeYear   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeMonth  ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeDay    ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeHour   ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeMinute ;
FOUNDATION_EXTERN NSString * const kDateFormatterTypeSecond ;


@interface NSDate (compare)

/**
 创建以当地时区的formatter
 @param type formatter 格式 yyyy-MM-dd HH:mm:ss
 @return formatter
 */
+ (NSDateFormatter *)dateFormatterWithType:(NSString*)type;

#pragma mark - date
/**
 对比两个时间差,返回特定str
 @param date 要对比的时间
 @return 返回值
 */
+ (NSString*)useNowDateCompareWithDate:(NSDate*)date;

/**
 只比较yyyy部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)yearsFromNowWithDate:(NSDate*)date;

/**
 只比较MM部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)monthsFromNowWithDate:(NSDate*)date;

/**
 只比较dd部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)daysFromNowWithDate:(NSDate*)date;

/**
 只比较HH部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)hoursFromNowWithDate:(NSDate*)date;

/**
 只比较mm部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)minutesFromNowWithDate:(NSDate*)date;

/**
 只比较ss部分
 @param date UTC时区时间，在计算过程中会将date转换成string，自动+8h
 @return result
 */
+ (NSInteger)secondsFromNowWithDate:(NSDate*)date;

#pragma mark - string
/**
 对比两个时间差,返回特定str
 @param dateStr 要对比的时间，格式：yyyy-MM-dd HH:mm:ss
 @return 返回值
 */
+ (NSString*)useNowDateCompareWithDateStr:(NSString*)dateStr;

/**
 只比较yyyy部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)yearsFromNowWithDateStr:(NSString*)dateStr;

/**
 只比较MM部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)monthsFromNowWithDateStr:(NSString*)dateStr;

/**
 只比较dd部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)daysFromNowWithDateStr:(NSString*)dateStr;

/**
 只比较HH部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)hoursFromNowWithDateStr:(NSString*)dateStr;

/**
 只比较mm部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)minutesFromNowWithDateStr:(NSString*)dateStr;

/**
 只比较ss部分
 @param dateStr 要比较的dateStr
 @return result
 */
+ (NSInteger)secondsFromNowWithDateStr:(NSString*)dateStr;

#pragma mark - conver type

/**
 会自动在date时间 +8h 以转换成北京时间
 @param date date
 @param type 样式
 @return result
 */
+ (NSString*)stringWithDate:(NSDate*)date formatterType:(NSString*)type;

/**
 dateStr格式必须是yyyy-MM-dd HH:mm:ss
 
 @param dateStr dateStr
 @param type type
 @return result
 */
+ (NSString*)stringWithDateString:(NSString*)dateStr formatterType:(NSString*)type;

#pragma mark - Days form date

/**
 比较当前时间与dataStr，结果为用 date - now
 
 @param date 要比较的时间
 @return 负值表示date是过去，正值表示date是将来
 */
+ (NSInteger)getDaysFromDate:(NSDate*)date;

/**
 比较当前时间与dataStr，结果为用 dateStr - nowStr
 
 @param dateStr 要比较的时间
 @return 负值表示dateStr是过去，正值表示dateStr是将来
 */
+ (NSInteger)getDaysFromDateStr:(NSString*)dateStr;

@end
