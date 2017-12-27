//
//  NSObject+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

-(NSData*)JSONData;
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

- (NSString *)JSONString
{
    NSData *jsonData = [self JSONData];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (NSInteger)parseInteger
{
    if (self == nil) return 0;
    NSScanner* scan = [NSScanner scannerWithString:[NSString stringWithFormat:@"%@",self]];
    NSInteger val;
    if([scan scanInteger:&val] && [scan isAtEnd]){
        return [[NSString stringWithFormat:@"%@",self] integerValue];
    }
    return 0;
}

@end
