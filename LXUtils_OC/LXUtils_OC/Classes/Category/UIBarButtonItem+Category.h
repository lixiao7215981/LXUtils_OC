//
//  UIBarButtonItem+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

/**
 *  创建 BarButtonItem
 *
 *  @param target     target
 *  @param action     action
 *  @param image      ButtonItem 图片
 *  @param hightImage ButtonItem 高亮图片
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *) itemWitchTaget:(id)target action:(SEL) action Image:(NSString *) image highlightImage:(NSString *) hightImage;

@end
