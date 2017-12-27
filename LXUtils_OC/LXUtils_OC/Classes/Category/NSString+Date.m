//
//  NSString+Date.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSString *)FormatterYYYYMMDD
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:self];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
}

- (NSDate *)FormatterDateFromYMDHMS
{
    NSDateFormatter *strToDateFor = [[NSDateFormatter alloc]init];
    strToDateFor.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    return [strToDateFor dateFromString:self];
}

- (NSDate *)FormatterDateFromYMD
{
    NSDateFormatter *strToDateFor = [[NSDateFormatter alloc]init];
    strToDateFor.dateFormat = @"yyyy/MM/dd";
    return [strToDateFor dateFromString:self];
}

@end
