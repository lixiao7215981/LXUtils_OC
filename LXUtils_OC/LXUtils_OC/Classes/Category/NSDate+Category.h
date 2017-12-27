//
//  NSDate+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

/**
 *  判断是不是今年
 */
- (BOOL) isThisYear;
/**
 *  判断是不是今天
 */
- (BOOL) isToday;

/**
 *  判断是不是昨天
 */
-(BOOL) isYesterday;

/**
 *  将NSDate转换为 YYYY-MM-DD  HH:mm:ss
 */
- (NSString*) FormatterYMDHMS;

/**
 *  将NSDate转换为 YYYY-MM-DD
 */
- (NSString*) FormatterYMD;

/**
 *  将NSDate转换为 HH:mm:ss
 */
- (NSString*) FormatterHMS;

/**
 *  获取时间毫秒数
 */
- (NSString *) getMillisecond;

/**
 *  比较两个日期的大小
 *
 *  @param date1 Date1
 *  @param date2 Date2
 *
 *  @return 比较结果
 *  {
 *      1   :   date2 > date1
 *      0   :   date2 = date1
 *     -1   :   date2 < date1
 *  }
 */
+ (NSInteger) compareData:(NSDate *)date1 WithDate:(NSDate *) date2;

/**
 *  比较两个日期的大小
 *
 *  yyyy-MM-dd HH:mm:ss
 *
 *  @param date1 String类型Date1
 *  @param date2 String类型Date2
 *
 *  @return 比较结果
 *  {
 *      1   :   date2 > date1
 *      0   :   date2 = date1
 *     -1   :   date2 < date1
 *  }
 */
+ (NSInteger) compareStrData:(NSString *)date1 WithDate:(NSString *) date2;

/**
 *  获取两个日期相差的秒数  单位秒
 *
 *  @param date1 Date1
 *  @param date2 Date2
 *
 *  @return 相差秒数  date2 - date1    date2 > date1
 */
+ (NSTimeInterval) getDiscrepancyData:(NSDate *)date1 WithDate:(NSDate *) date2;

@end
