//
//  NSString+Date.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define  PATTERN_STANDARD08W  @"yyyyMMdd"
#define  PATTERN_STANDARD12W  @"yyyyMMddHHmm"
#define  PATTERN_STANDARD14W  @"yyyyMMddHHmmss"
#define  PATTERN_STANDARD17W  @"yyyyMMddHHmmssSSS"
#define  PATTERN_STANDARD10H  @"yyyy-MM-dd"
#define  PATTERN_STANDARD16H  @"yyyy-MM-dd HH:mm"
#define  PATTERN_STANDARD19H  @"yyyy-MM-dd HH:mm:ss"
#define  PATTERN_STANDARD10X  @"yyyy/MM/dd"
#define  PATTERN_STANDARD16X  @"yyyy/MM/dd HH:mm"
#define  PATTERN_STANDARD19X  @"yyyy/MM/dd HH:mm:ss"
#define  PATTERN_STANDARD20H  @"HH:mm"
#define  PATTERN_STANDARD21H  @"HH"

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

/**
 *  将 String 类型转化位 Date 类型自定义
 */
- (NSDate *) FormatterDateFromCustomFormat:(NSString *) format;

@end

NS_ASSUME_NONNULL_END
