//
//  NSString+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)
/**
 *  转换成金额string
 *
 *  @return ￥ 字体小于后台金额
 */
- (NSAttributedString *) toMoneyString;
/**
 *  去掉字符串左右两边的空格
 *
 *  @return 去掉空格后的字符串
 */
- (NSString *) toClearBlankString;
/**
 *  删掉字符串前边多余的 "0"
 */
- (NSString *) removeStringFrontZero;
/**
 *  将NSString 转化为NSData 二进制
 */
- (NSData *) stringHexToBytes;
/**
 *  根据传入的字体计算所占大小
 *
 */
- (CGSize) sizeWithFont:(UIFont *) font;
/**
 *  根据传入的字体计算所占大小
 *  width : 传入最大宽度计算出高度
 */
- (CGSize) sizeWithFont:(UIFont *)font Width:(CGFloat) width;
/**
 *  对 url 进行编码
 *
 */
- (NSString *)encodeToPercentEscapeString;
/**
 *  对 url 进行解码
 *
 */
- (NSString *)decodeFromPercentEscapeString;

#pragma mark ------  编码转换  --------

/**
 *  将 String 类型进行 Base64 编码 NSUTF8StringEncoding
 *
 *  @param input 编码前 String
 *
 *  @return 编码后 String
 */
+ (NSString*)encodeBase64String:(NSString *)input;
/**
 *  将 String 类型进行 Base64 解码 NSUTF8StringEncoding
 *
 *  @param input 解码前 String
 *
 *  @return 解码后 String
 */
+ (NSString*)decodeBase64String:(NSString *)input;
/**
 *  将 Data 类型进行 Base64 编码 NSUTF8StringEncoding
 *
 *   input 编码前 String
 *
 *  @return 编码后 String
 */
+ (NSString*)encodeBase64Data:(NSData *)data;
/**
 *  将 Data 类型进行 Base64 解码 NSUTF8StringEncoding
 *
 *   input 解码前 String
 *
 *  @return 解码后 String
 */
+ (NSString*)decodeBase64Data:(NSData *)base64Data;
/**
 *  将十六进制转换为普通字符串
 *
 *  @return UTF-8 类型普通字符串
 */
- (NSString *)toStringFromHexString;
/**
 *  将字符串转换为十六进制字符串
 *
 *  @return 十六进制字符串
 */
- (NSString *)toHexStringFromString;
/**
 *  将 base64 加密符串转换为十六进制字符串
 *
 *  @return 十六进制字符串
 */
- (NSString *)toHexStringFromBase64String;
/**
 *  将 Data类型加密符串转换为十六进制字符串
 *
 *  @return 十六进制字符串
 */
- (NSString *) toHexStringFromData:(NSData *) data;

@end
