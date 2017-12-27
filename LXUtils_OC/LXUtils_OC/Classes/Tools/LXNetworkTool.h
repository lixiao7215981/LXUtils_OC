//
//  LXNetworkTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXNetworkTool : NSObject

/** 与互联网断开连接 */
extern NSString * const kUseDisconnectInternet;

/** 使用 WiFi 连接互联网 */
extern NSString * const kUseWiFiConnectInternet;

/** 使用移动蜂窝数据连接互联网 */
extern NSString * const kUseMobileNetworkConnectInternet;


/**
 *  开始监控网络连接方式改变
 *
 *  @param url 传入监控的URL
 */
+ (void) startNetWrokWithURL:(NSString *) url;

/**
 *  是否连接上互联网
 *
 *  @return YES：未连接  NO：连接上
 */
+ (BOOL)isNotConnectNetWork;

/**
 *  是否WIFI
 */
+ (BOOL)isConnectWIFI;

/**
 *  是否3G/4G
 */
+ (BOOL)isConnect3G4G;

@end
