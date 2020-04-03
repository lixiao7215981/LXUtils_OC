//
//  LXDeviceTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXDeviceTool.h"
#import <UIKit/UIKit.h>
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

/// App 版本
+ (NSString *)getApp_Version
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
/// app build版本
+ (NSString *)getApp_BuildVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}
///手机系统版本
+ (NSString *)getPhone_Version
{
    return [[UIDevice currentDevice] systemVersion];
}
/// 手机型号
+ (NSString *)getPhone_Model
{
    return [[UIDevice currentDevice] model];
}
///地方型号  （国际化区域名称）
+ (NSString *)getPhone_localizedModel
{
    return [[UIDevice currentDevice] localizedModel];
}
/// 获取当前APP的BundleIdentifier
+ (NSString *) getApp_BundleIdentifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
