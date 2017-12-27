//
//  NSString+Verify.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

- (BOOL)match:(NSString *)pattern
{
    // 1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}

- (BOOL)isRightfulUserName
{
    return [self match:@"^[a-zA-z][a-zA-Z0-9_]{2,9}$"];
}

- (BOOL)isRightfulPassword
{
    return [self match:@"(([0-9]+[a-zA-Z]+[0-9]*)|([a-zA-Z]+[0-9]+[a-zA-Z]*))"];
}

- (BOOL)isQQ
{
    return [self match:@"^[1-9]\\d{4,10}$"];
}

- (BOOL)isPhoneNumber
{
    if (self.length != 11) {
        return NO;
    }
    return [self match:@"[1][0123456789]\\d{9}"];
}

- (BOOL)isIPAddress
{
    return [self match:@"^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$"];
}

- (BOOL)isNullString
{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isEqualToString:@""]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (BOOL)canParseDouble
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    double val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)canParseInteger
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)containsHaveEmoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (hs == 0xd83e || hs == 0x263a) {
            returnValue = YES;
        } else if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0x231a) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}

@end
