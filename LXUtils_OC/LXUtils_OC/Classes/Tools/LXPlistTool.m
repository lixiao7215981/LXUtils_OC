//
//  LXPlistTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXPlistTool.h"

@implementation LXPlistTool

+ (NSArray *)loadPlistWithName:(NSString *) name AndType:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type ? type :@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

+ (NSArray *) loadTabBarCenterViewWithName:(NSString *) name
{
    return [self loadPlistWithName:name AndType:nil];
}


@end
