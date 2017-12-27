//
//  LXQRCodeTool.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LXQRCodeTool : NSObject

/**
 *  根据字符串创建二维码
 *
 *  String： 字符串
 *  sizeWH： 大小宽高
 */
+ (UIImage *)createQRCodeFromString:(NSString *) string WithSize:(CGFloat)sizeWH;

@end
