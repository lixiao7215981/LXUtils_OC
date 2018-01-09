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


+(void)startNetWrokWithURL:(NSString *)url
{
    Reachability *reach;
    if (url == nil) {
        reach = [Reachability reachabilityForInternetConnection];
    }else{
        reach = [Reachability reachabilityWithHostname:url];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    [reach startNotifier];
}

+ (void) startNetWrokWithURL:(NSString *) url NetWorkChanged:(connectNetWork) connected
{
    Reachability *reach;
    if (url == nil) {
        reach = [Reachability reachabilityForInternetConnection];
    }else{
        reach = [Reachability reachabilityWithHostname:url];
    }
    [reach startNotifier];
    reach.reachabilityBlock = ^(Reachability *reachability, SCNetworkConnectionFlags flags) {
        if ([reachability isReachableViaWiFi] || [reachability isReachableViaWWAN]) {
            if (connected) {
                connected();
            }
        }
    };
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
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable);
}

+ (BOOL)isConnectWIFI
{
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == ReachableViaWiFi);
}

+ (BOOL)isConnectWWAN
{
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == ReachableViaWWAN);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
