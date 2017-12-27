//
//  NSString+Verify.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

/**
 *  是否为空字符串 NSNULL class
 */
- (BOOL) isNullString;
/**
 *  验证用户名是否合法
 *  用户名由 3-10位的字母下划线和数字组成。不能以数字或下划线开头。只能已字母开头。允许全部是字母
 */
- (BOOL) isRightfulUserName;
/**
 *  验证密码是否合法
 *  以字母开头，长度在6-12之间，只能包含字符、数字和下划线
 */
- (BOOL) isRightfulPassword;
/**
 *  是否 QQ 格式
 */
- (BOOL) isQQ;
/**
 *  是否为手机号格式
 */
- (BOOL) isPhoneNumber;
/**
 *  是否 IP 地址格式
 */
- (BOOL) isIPAddress;
/**
 *  是否含有 Emoji 表情
 */
- (BOOL) containsHaveEmoji;

/**
 *  是否可转换成 Double 类型
 */
- (BOOL) canParseDouble;

/**
 *  是否可转换成 Int 类型
 */
- (BOOL) canParseInteger;

@end
