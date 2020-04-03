//
//  NSDate+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

/**
 *  判断是不是今年
 *
 */
- (BOOL) isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger crateYear =  [calendar components: NSCalendarUnitYear fromDate:self].year;
    NSInteger nowYear = [calendar components: NSCalendarUnitYear fromDate:[NSDate date]].year;
    return crateYear == nowYear;
}

/**
 *  判断是不是今天
 *
 */
- (BOOL) isToday
{
    NSDateFormatter *sdf = [[NSDateFormatter alloc] init];
    sdf.dateFormat = @"yyyy-MM-dd";
    NSString *createStr = [sdf stringFromDate:self];
    NSString *nowStr = [sdf stringFromDate:[NSDate date]];
    return [createStr isEqualToString:nowStr];
}

/**
 *  判断是不是昨天
 *
 */
-(BOOL) isYesterday
{
    NSCalendarUnit unit = kCFCalendarUnitDay | kCFCalendarUnitMonth | kCFCalendarUnitYear;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter *sdf = [[NSDateFormatter alloc] init];
    sdf.dateFormat = @"yyyy-MM-dd";
    NSString *createStr = [sdf stringFromDate:self];
    NSDate *createDate = [sdf dateFromString:createStr];
    
    NSString *nowStr = [sdf stringFromDate:[NSDate date]];
    NSDate *nowDate = [sdf dateFromString:nowStr];
    
    NSDateComponents *component =  [calendar components:unit fromDate:createDate toDate:nowDate options:0];
    return (component.year ==0 && component.month == 0 && component.day == 1);
}

- (NSString*)FormatterYMDHMS
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:self];
}

- (NSString *)FormatterYMD
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:self];
}

- (NSString *)FormatterHMS
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm:ss";
    return [formatter stringFromDate:self];
}

- (NSString *)getMillisecond
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;  //  *1000 是精确到毫秒，不乘就是精确到秒
    return [NSString stringWithFormat:@"%f", a]; //转为字符型
}

+ (NSInteger)compareData:(NSDate *)date1 WithDate:(NSDate *)date2
{
    NSComparisonResult result = [date1 compare:date2];
    if (result == NSOrderedAscending) { //升序，右边 > 左边
        return 1 ;
    }else if (result == NSOrderedSame){
        return 0;
    }else if (result == NSOrderedDescending){ //降序，右边 < 左边
        return -1;
    }
    return 0;
}

+ (NSInteger)compareStrData:(NSString *)date1 WithDate:(NSString *)date2
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    if (date1.length > 10 && date2.length > 10) {
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [df setDateFormat:@"yyyy-MM-dd"];
    }
    NSDate *dt1 = [df dateFromString:date1];
    NSDate *dt2 = [df dateFromString:date2];
    return  [self compareData:dt1 WithDate:dt2];
}

+ (NSTimeInterval)getDiscrepancyData:(NSDate *)date1 WithDate:(NSDate *)date2
{
    NSTimeInterval dt1 = [date1 timeIntervalSince1970];
    NSTimeInterval dt2 = [date2 timeIntervalSince1970];
    return dt2 - dt1;
}

/// 返回当前时间日期的参数
/// @param unit     年/月/日/时/分/秒
+ (NSInteger) getDateParamFrom:(NSCalendarUnit) unit{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =
    NSCalendarUnitYear | //年
    NSCalendarUnitMonth | //月份
    NSCalendarUnitDay | //日
    NSCalendarUnitHour |  //小时
    NSCalendarUnitMinute |  //分钟
    NSCalendarUnitSecond;  // 秒
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:[NSDate date]];
    
    if (unit == NSCalendarUnitYear) {
        return [dateComponent year];
    }
    if (unit == NSCalendarUnitMonth) {
        return [dateComponent month];
    }
    if (unit == NSCalendarUnitDay) {
        return [dateComponent day];
    }
    if (unit == NSCalendarUnitHour) {
        return [dateComponent hour];
    }
    if (unit == NSCalendarUnitMinute) {
        return [dateComponent minute];
    }
    if (unit == NSCalendarUnitSecond) {
        return [dateComponent second];
    }
    return 0;
}

///给一个date返回上一个月或者下一个月
+ (NSString *)getHistoryDate:(NSDate*)newDate number:(NSInteger)num AddAndSubtract:(BOOL)AddSub {
    
    //获取NSCalender单例
    NSCalendar *calender = [NSCalendar currentCalendar];
    //设置属性，因为我只需要年和月，这个属性还可以支持时，分，秒
    NSDateComponents *cmp = [calender components:(NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:newDate];
    //设置上个月，即在现有的基础上减去一个月(2017年1月 减去一个月 会得到2016年12月)
    
    if(AddSub) {
        [cmp setMonth:[cmp month] + num];
        
    }else{
        [cmp setMonth:[cmp month] - num];
    }
    
    //拿到上个月的NSDate，再用NSDateFormatter就可以拿到单独的年和月了。
    
    return [[calender dateFromComponents:cmp] FormatterYMD];
}

@end
