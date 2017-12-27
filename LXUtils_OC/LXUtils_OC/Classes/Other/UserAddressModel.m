//
//  UserAddressModel.m
//  WebIntegration
//
//  Created by 李晓 on 15/8/27.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "UserAddressModel.h"

@implementation UserAddressModel

- (NSString *) City
{
    NSRange range = [_City rangeOfString:@"市"];
    if (range.location != NSNotFound) {
        if (_City.length > range.location) {
            return [_City substringToIndex:range.location +1];
        }
    }
    return _City;
}

+ (instancetype)initWith:(NSDictionary *)dict
{
    UserAddressModel *addressModel = [[UserAddressModel alloc] init];
    addressModel.SubLocality = [dict objectForKey:@"SubLocality"];
    addressModel.CountryCode = [dict objectForKey:@"CountryCode"];
    addressModel.Street = [dict objectForKey:@"Street"];
    addressModel.State = [dict objectForKey:@"State"];
    addressModel.Name = [dict objectForKey:@"Name"];
    addressModel.Thoroughfare = [dict objectForKey:@"Thoroughfare"];
    addressModel.Country = [dict objectForKey:@"Country"];
    addressModel.City = [dict objectForKey:@"City"];
    
    return addressModel;
}

@end
