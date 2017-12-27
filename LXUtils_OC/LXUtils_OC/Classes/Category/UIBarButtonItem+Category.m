//
//  UIBarButtonItem+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *) itemWitchTaget:(id)target action:(SEL) action Image:(NSString *) image highlightImage:(NSString *) hightImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置当点击自定义按钮的时候，调用哪个控制器中的哪个方法
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    UIImage *currentImage = [button currentImage];
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, currentImage.size.width, currentImage.size.height);
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
