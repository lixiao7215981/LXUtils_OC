//
//  LXPlistTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXPlistTool : NSObject

/**
 *  获取plist 文件
 *
 *  @param name 文件名
 *  @param type 类型不传自动添加
 *
 *  @return 转换成的Array
 */
+ (NSArray *)loadPlistWithName:(NSString *) name AndType:(NSString *)type;


+ (NSArray *) loadTabBarCenterViewWithName:(NSString *) name;

@end
