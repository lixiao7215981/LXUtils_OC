//
//  NSArray+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

- (NSString *)toStringSeparatedByComma
{
    NSMutableString *commaStr = [NSMutableString string];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *str;
        if (obj != nil) {
            str = [NSString stringWithFormat:@"%@",obj];
        }
        if (str && str.length) {
            [commaStr appendFormat:@"%@,",str];
        }
    }];
    if (commaStr.length > 1) {
        return [commaStr substringToIndex:commaStr.length - 1];
    }else{
        return @"";
    }
}

@end
