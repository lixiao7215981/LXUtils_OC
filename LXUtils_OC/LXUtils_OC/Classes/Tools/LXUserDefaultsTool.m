//
//  LXUserDefaultsTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXUserDefaultsTool.h"

@implementation LXUserDefaultsTool

static NSUserDefaults *_Udefaults;

+ (void)initialize
{
    _Udefaults = [NSUserDefaults standardUserDefaults];
}

+ (void) setUserDefaultsWith:(id) obj forKey:(NSString *) key
{
    [_Udefaults setObject:obj forKey:key];
    [_Udefaults synchronize];
}

+ (id) getUserDefaultsForKey:(NSString *) key
{
    return [_Udefaults objectForKey:key];
}

+ (void)removeUserDefaultsForKey:(NSString *)key
{
    [_Udefaults removeObjectForKey:key];
    [_Udefaults synchronize];
}

@end
