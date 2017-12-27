//
//  LXBundleTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LXBundleTool : NSObject

/**
 *  从 boundle中获取资源文件图片
 *
 *  @param name 图片名称
 *
 *  @return UIImage
 */
+ (UIImage *) getImage:(NSString *)name FromBundle:(NSString *) bundle;

/**
 *  从 boundle 中获取资源文件 XIB
 *
 *  @param name xib名称
 *
 *  @return UIViewController
 */
+ (id) getViewControllerNibName:(NSString *) name FromBundle:(NSString *) bundle;

/**
 *  从 boundle中获取资源文件
 *
 *  @param name 文件名称
 *
 *  @return NSData
 */
+ (NSData *)getFileDataWithName:(NSString *)name FromBundle:(NSString *)bundle;

/**
 *  从 boundle 中获取ArrayPlist
 *
 *  @param name   文件名
 *  @param bundle bundle名
 *
 *  @return NSArray
 */
+ (NSArray *)getArrayWithName:(NSString *)name FromBundle:(NSString *)bundle;

@end
