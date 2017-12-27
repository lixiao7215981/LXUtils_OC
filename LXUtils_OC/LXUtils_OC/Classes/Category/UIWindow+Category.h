//
//  UIWindow+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Category)

/**
 *  切换当前窗口的RootViewController
 *
 *  @param viewController 要切换到的ViewController
 *
 *  @return 切换成功后的Window
 */
+ (UIWindow *) changeWindowRootViewController:(UIViewController *) viewController animated:(BOOL)animated;

/**
 *  获取当前最上面显示的窗口
 *
 *  @return Window
 */
+ (UIWindow *) getCurrentWindow;

@end
