//
//  NSDate+compare.m
//  
//  Created by FLY on 2017/10/20.
//  Copyright © 2017年 FLY. All rights reserved.
//

#import "NSDate+compare.h"

NSString * const kDateFormatterTypeFull   = @"yyyy-MM-dd HH:mm:ss";
NSString * const kDateFormatterTypeLong   = @"yyyy-MM-dd HH:mm";
NSString * const kDateFormatterTypeMore   = @"yyyy-MM-dd";
NSString * const kDateFormatterTypeMiddle = @"MM-dd HH:mm";
NSString * const kDateFormatterTypeShort  = @"MM-dd";
NSString * const kDateFormatterTypeLess   = @"HH:mm";
NSString * const kDateFormatterTypeYear   = @"yyyy";
NSString * const kDateFormatterTypeMonth  = @"MM";
NSString * const kDateFormatterTypeDay    = @"dd";
NSString * const kDateFormatterTypeHour   = @"HH";
NSString * const kDateFormatterTypeMinute = @"mm";
NSString * const kDateFormatterTypeSecond = @"ss";

@implementation NSDate (compare)

#pragma mark - base
+ (NSDateFormatter *)dateFormatterWithType:(NSString*)type{
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:type];
    return formatter;
}

- (NSInteger)compareWithDate:(NSDate*)date formatter:(NSDateFormatter*)formatter{
    
    NSString *nowStr  = [formatter stringFromDate:self];
    NSString *timeStr = [formatter stringFromDate:date];
    
    NSInteger nowInt  = [nowStr  integerValue];
    NSInteger timInt  = [timeStr integerValue];
    
    return nowInt - timInt;
}

+ (NSInteger)compareWithDateStr:(NSString*)dateStr formatterType:(NSString*)type{
    
    NSDateFormatter * fullFormatter = [NSDate dateFormatterWithType:kDateFormatterTypeFull];
    
    NSDate * now = [NSDate date];
    
    NSDateFormatter * formatter = [NSDate dateFormatterWithType:type];
    
    NSDate * date = [fullFormatter dateFromString:dateStr];
    
    return [now compareWithDate:date formatter:formatter];
}

+ (NSInteger)compareWithDate:(NSDate*)date formatterType:(NSString*)type{
    
    NSDateFormatter * formatter = [NSDate dateFormatterWithType:type];
    
    NSDate * now = [NSDate date];
    
    return [now compareWithDate:date formatter:formatter];
}

+ (NSDateComponents*)compareWithDate:(NSDate*)date{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate * startDate = [NSDate date];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:startDate toDate:date options:0];
    
    //    NSLog(@"\n startDate = %@ \n date = %@ \n comps = %@",startDate,date,components);
    return components;
}

#pragma mark - date
+ (NSString*)useNowDateCompareWithDate:(NSDate*)date{
    
    NSDateComponents *components =  [NSDate compareWithDate:date];
    
    NSInteger years    = - [components year];
    NSInteger months   = - [components month];
    NSInteger days     = - [components day];
    NSInteger hours    = - [components hour];
    NSInteger minutes  = - [components minute];
    NSInteger senconds = - [components second];
    
    if (years > 0) {
        return [NSString stringWithFormat:@"%ld年",years];
    }
    if (months > 0){
        return [NSString stringWithFormat:@"%ld月",months];
    }
    if (days > 0){
        return [NSString stringWithFormat:@"%ld天",days];
    }
    if (hours > 0){
        return [NSString stringWithFormat:@"%ld小时",hours];
    }
    if (minutes > 0){
        return [NSString stringWithFormat:@"%ld分",minutes];
    }
    if (senconds > 0) {
        return [NSString stringWithFormat:@"%ld秒",senconds];
    }
    
    return nil;
}


+ (NSInteger)yearsFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeYear];
}

+ (NSInteger)monthsFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeMonth];
}

+ (NSInteger)daysFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeDay];
}

+ (NSInteger)hoursFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeHour];
}

+ (NSInteger)minutesFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeMonth];
}


+ (NSInteger)secondsFromNowWithDate:(NSDate*)date{
    return [NSDate compareWithDate:date formatterType:kDateFormatterTypeSecond];
}

#pragma mark- string
+ (NSString*)useNowDateCompareWithDateStr:(NSString*)dateStr{
    
    NSDateFormatter * formatter = [NSDate dateFormatterWithType:kDateFormatterTypeFull];
    
    NSDate * date = [formatter dateFromString:dateStr];
    
    return [NSDate useNowDateCompareWithDate:date];
    
}

+ (NSInteger)yearsFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeYear];
}

+ (NSInteger)monthsFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeMonth];
}

+ (NSInteger)daysFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeDay];
}

+ (NSInteger)hoursFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeHour];
}

+ (NSInteger)minutesFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeMinute];
}

+ (NSInteger)secondsFromNowWithDateStr:(NSString*)dateStr{
    return [NSDate compareWithDateStr:dateStr formatterType:kDateFormatterTypeSecond];
}

#pragma mark - conver

+ (NSString*)stringWithDate:(NSDate*)date formatterType:(NSString*)type{
    
    NSDateFormatter * formatter = [NSDate dateFormatterWithType:type];
    
    return [formatter stringFromDate:date];
}

+ (NSString*)stringWithDateString:(NSString*)dateStr formatterType:(NSString*)type{
    
    NSDateFormatter * fullFormatter = [NSDate dateFormatterWithType:kDateFormatterTypeFull];
    
    NSDate* targetDate = [fullFormatter dateFromString:dateStr];
    
    NSDateFormatter * formatter = [NSDate dateFormatterWithType:type];
    
    return [formatter stringFromDate:targetDate];
}

#pragma mark - Days form date
+ (NSInteger)getDaysFromDate:(NSDate*)date{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate * startDate = [NSDate date];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:startDate toDate:date options:0];
    
    NSInteger days = [components day];
    
    return days;
    
}

+ (NSInteger)getDaysFromDateStr:(NSString*)dateStr{
    
    NSDateFormatter * formmatter = [NSDate dateFormatterWithType:kDateFormatterTypeFull];
    
    NSDate * endDate = [formmatter dateFromString:dateStr];
    
    return [NSDate getDaysFromDate:endDate];
}

@end
