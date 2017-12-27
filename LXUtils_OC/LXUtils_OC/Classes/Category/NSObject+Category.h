//
//  NSObject+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

/**
 *  将NSArray或者NSDictionary转化为JsonData
 */
- (NSData*)JSONData;

/**
 *  将NSArray或者NSDictionary转化为JsonString
 */
- (NSString *)JSONString;


/**
 将 NSObject 类型转换为 Integer 类型
 
 @return NSInterger
 */
- (NSInteger) parseInteger;

@end
