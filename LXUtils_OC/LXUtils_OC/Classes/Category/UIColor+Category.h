//
//  UIColor+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/**
 *  根据 16 进制字符串生成颜色 例子：#2c5aa5
 *
 *  @param stringToConvert 16进制String
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/**
 *  返回一些 16 进制的颜色
 *
 *  @return NAarray
 */
+ (NSArray *)someHexColors;


/**
 *  判断两个颜色是否相等
 */
+ (BOOL) isTheSameColor2:(UIColor*)color1 anotherColor:(UIColor*)color2;

@end
