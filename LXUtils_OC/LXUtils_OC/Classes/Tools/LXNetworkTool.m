//
//  LXNetworkTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXNetworkTool.h"
#import "Reachability.h"

@implementation LXNetworkTool

NSString * const kUseDisconnectInternet = @"kUseDisconnectInternet";

NSString * const kUseWiFiConnectInternet = @"kUseWiFiConnectInternet";

NSString * const kUseMobileNetworkConnectInternet = @"kUseMobileNetworkConnectInternet";

NSString * const kOpenHttpRequestLog = @"kOpenHttpRequestLog";

NSString * const kShowGuidancePage = @"kShowGuidancePage";



+(void)startNetWrokWithURL:(NSString *)url
{
    Reachability *reach = [Reachability reachabilityWithHostname:url];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    [reach startNotifier];
}

+ (void) reachabilityChanged: (NSNotification*)note {
    Reachability * reach = [note object];
    
    if(![reach isReachable])
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:kUseDisconnectInternet object:nil];
        return;
    }
    
    if (reach.isReachableViaWiFi) {
        [[NSNotificationCenter defaultCenter]postNotificationName:kUseWiFiConnectInternet object:nil];
        return;
    }
    
    if (reach.isReachableViaWWAN) {
        [[NSNotificationCenter defaultCenter]postNotificationName:kUseMobileNetworkConnectInternet object:nil];
        return;
    }
}

+ (BOOL)isNotConnectNetWork
{
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] == NotReachable);
}

+ (BOOL)isConnectWIFI
{
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] == ReachableViaWiFi);
}

+ (BOOL)isConnect3G4G
{
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == ReachableViaWWAN);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
