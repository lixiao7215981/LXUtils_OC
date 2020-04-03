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
    formatter.dateFormat = PATTERN_STANDARD19H;
    NSDate *date = [formatter dateFromString:self];
    formatter.dateFormat = PATTERN_STANDARD10H;
    return [formatter stringFromDate:date];
}

- (NSDate *)FormatterDateFromYMDHMS
{
    NSDateFormatter *strToDateFor = [[NSDateFormatter alloc]init];
    strToDateFor.dateFormat = PATTERN_STANDARD19X;
    return [strToDateFor dateFromString:self];
}

- (NSDate *)FormatterDateFromYMD
{
    NSDateFormatter *strToDateFor = [[NSDateFormatter alloc]init];
    strToDateFor.dateFormat = PATTERN_STANDARD10X;
    return [strToDateFor dateFromString:self];
}

- (NSDate *)FormatterDateFromCustomFormat:(NSString *)format
{
    NSDateFormatter *strToDateFor = [[NSDateFormatter alloc]init];
    strToDateFor.dateFormat = format;
    NSLog(@"-----FormatterDateFromCustomFormat------%@",self);
    return [strToDateFor dateFromString:self];
}

@end
