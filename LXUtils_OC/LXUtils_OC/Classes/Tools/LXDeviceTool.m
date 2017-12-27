//
//  LXDeviceTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXDeviceTool.h"

@implementation LXDeviceTool

+ (NSString *) getUUID
{
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    NSString *guid = (__bridge NSString *)newUniqueIDString;
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    NSString *UUID = [guid lowercaseString];
    return UUID;
}


+ (NSString *)getApp_Version
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}


+ (NSString *) getApp_BundleIdentifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
