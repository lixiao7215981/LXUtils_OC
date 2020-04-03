//
//  LXDeviceTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXDeviceTool : NSObject

/**
 *  获取设备的UUID
 *
 *  @return 这个UUID 每一次获取都会改变。如果想要保证不改变，需要使用CHKeychain 存储起来
 *
 */
+ (NSString *) getUUID;

/**
 *  获取当前APP的版本
 *
 *  @return 版本号
 */
+ (NSString *) getApp_Version;

/**
 *  获取当前APP的BundleIdentifier
 *
 *  @return BundleIdentifier
 */
+ (NSString *) getApp_BundleIdentifier;

///地方型号  （国际化区域名称）
+ (NSString *)getPhone_localizedModel;
/// 手机型号
+ (NSString *)getPhone_Model;
///手机系统版本
+ (NSString *)getPhone_Version;
/// app build版本
+ (NSString *)getApp_BuildVersion;
@end
