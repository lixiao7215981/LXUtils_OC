//
//  NSString+Date.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

/**
 *  将 年月日时分秒时间转换为 仅年月日的时间
 */
- (NSString *)FormatterYYYYMMDD;
/**
 *  将 String 类型转化位 Date 类型 YYYY-MM-DD  HH:mm:ss
 */
- (NSDate *) FormatterDateFromYMDHMS;
/**
 *  将 String 类型转化位 Date 类型 YYYY-MM-DD
 */
- (NSDate *) FormatterDateFromYMD;

@end
