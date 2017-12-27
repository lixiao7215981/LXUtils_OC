//
//  UITextView+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "UITextView+Category.h"

@implementation UITextView (Category)

- (void)insertAttributedText:(NSAttributedString *)attributed
{
    [self insertAttributedText:attributed settingBlocks:nil];
}

- (void)insertAttributedText:(NSAttributedString *)attributed settingBlocks:(void (^)(NSMutableAttributedString *))settingBlock
{
    // 创建一个可变的属性文字
    NSMutableAttributedString *mutableAttributed = [[NSMutableAttributedString alloc] init];
    // 因为是要在以前的基础上追加，所以要先添加以前的文字
    [mutableAttributed appendAttributedString:self.attributedText];
    // 将新创建的属性文字替换光标选中的位置（光标如果在最后面就是直接添加到文字最后面）
    [mutableAttributed replaceCharactersInRange:self.selectedRange withAttributedString : attributed];
    // 设置所有文字的字体为当前textView的字体（图片大小也会跟着改变）
    [mutableAttributed addAttribute : NSFontAttributeName value:self.font range:NSMakeRange(0, mutableAttributed.length)];
    
    // 检测如果有block就执行
    if (settingBlock) {
        settingBlock(mutableAttributed);
    }
    // 给textview 属性赋值新的属性文字
    self.attributedText = mutableAttributed;
    // 设置光标的位置为添加位置的后一个位置
    self.selectedRange = NSMakeRange(self.selectedRange.location + 1, 0);
}

@end
