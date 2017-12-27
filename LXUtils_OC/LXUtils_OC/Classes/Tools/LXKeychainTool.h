//
//  LXKeychainTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const KEY_DEVICE_UUID ;
extern NSString * const KEY_USERNAME ;
extern NSString * const KEY_PASSWORD ;

@interface LXKeychainTool : NSObject

/**
 *  存储UUID 保证唯一性
 *    if(![CHKeychainTool load:KEY_DEVICE_UUID]){
 *      [CHKeychainTool save:KEY_DEVICE_UUID data:[SystemDeviceTool getUUID]];
 *     }
 *
 *  @param service KEY
 *  @param data    任何形式的数据
 */
+ (void)save:(NSString *)service data:(id)data;
/**
 *  加载存储的数据
 *
 *  [CHKeychainTool load:KEY_DEVICE_UUID]
 *  @param service KEY
 *
 *  @return id类型数据
 */
+ (id)load:(NSString *)service;
/**
 *  删除存储的数据
 *
 *  @param service KEY
 */
+ (void)delete:(NSString *)service;

@end
