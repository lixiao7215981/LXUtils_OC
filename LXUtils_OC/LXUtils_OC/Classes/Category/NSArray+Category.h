//
//  NSArray+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

/**
 *  将数组中元素按照 “,” 分割成字符串
 *  支持 string int  double 等基础数据类型
 *  @[1,2,3]
 *  @return @“1,2,3”
 */
- (NSString *) toStringSeparatedByComma;

@end
