//
//  UITextView+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Category)

/**
 *  textView 光标选中的位置插入属性文字
 *
 *  @param attributed 属性文字
 */
- (void) insertAttributedText:(NSAttributedString *) attributed;

/**
 *  textView 光标选中的位置插入属性文字，并可以改变所有文字的大小
 *
 *  @param attributed 属性文字
 */
- (void) insertAttributedText:(NSAttributedString *) attributed settingBlocks:(void(^)(NSMutableAttributedString * attribute)) settingBlock;

@end
