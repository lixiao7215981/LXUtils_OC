//
//  LXCoreLocationTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXCoreLocationTool.h"

@interface LXCoreLocationTool ()<CLLocationManagerDelegate>
/**
 *   定位的Manager
 */
@property (nonatomic ,strong) CLLocationManager *mgr;
/**
 *  地理编码对象
 */
@property (nonatomic,strong) CLGeocoder *code;

@end

@implementation LXCoreLocationTool

- (void)getLocation:(locationOption)option
{
    self.option = option;
    self.mgr.delegate = self;
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        [self.mgr requestAlwaysAuthorization];
    }else{
        [self.mgr startUpdatingLocation];
    }
}

/**
 *  地理编码
 */

- (void)geocodeAddressString:(NSString *)addressString userAddress:(void (^)(CLPlacemark *))placemark
{
    [self.code geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *pacemark = [placemarks firstObject];
        if (placemark) {
            placemark(pacemark);
        }
    }];
}

/**
 *  反地理编码
 */
- (void)reverseGeocodeLocation:(CLLocation *)location userAddress:(void (^)(UserAddressModel *))userAddress
{
    [self.code reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *pacemark = [placemarks firstObject];
        UserAddressModel *address = [UserAddressModel initWith:pacemark.addressDictionary];
        if (userAddress) {
            userAddress(address);
        }
    }];
    
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"等待用户授权");
    }else if (status == kCLAuthorizationStatusAuthorizedAlways){
        [self.mgr startUpdatingLocation];
    }else{
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"定位信息授权失败，将无法获取您所在地的天气情况，请前往设置开启"  preferredStyle:UIAlertControllerStyleAlert];
        [alertC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if (@available(iOS 10.0, *)) {
                if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
                    NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
                    [[UIApplication sharedApplication] openURL:url options:options completionHandler:nil];
                }
            } else {
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        }]];
        
        [alertC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }]];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.mgr stopUpdatingLocation];
    CLLocation *location = [locations lastObject];
    self.option(location);
    [self.mgr stopUpdatingLocation];
}

#pragma mark - 懒加载
- (CLLocationManager *)mgr
{
    if (!_mgr) {
        _mgr = [[CLLocationManager alloc] init];
        _mgr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    }
    return _mgr;
}

- (CLGeocoder *)code
{
    if (!_code) {
        _code = [[CLGeocoder alloc] init];
    }
    return _code;
}

@end
