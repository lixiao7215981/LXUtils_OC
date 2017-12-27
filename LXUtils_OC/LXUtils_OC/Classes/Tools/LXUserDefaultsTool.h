//
//  LXUserDefaultsTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXUserDefaultsTool : NSObject

/**
 *  存储偏好设置
 *
 *  @param obj 要存储的对象
 *  @param key 所使用的Key
 */
+ (void) setUserDefaultsWith:(id) obj forKey:(NSString *) key;

/**
 *  取存储的偏好设置
 *
 *  @param key 所使用的Key
 *
 *  @return 取出存储的对象
 */
+ (id) getUserDefaultsForKey:(NSString *) key;

/**
 *  删除偏好设置
 *
 *  @param key 所使用的Key
 */
+ (void) removeUserDefaultsForKey:(NSString *) key;

@end
