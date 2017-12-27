//
//  UIWindow+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "UIWindow+Category.h"

@implementation UIWindow (Category)

+ (UIWindow *) changeWindowRootViewController:(UIViewController *) viewController animated:(BOOL)animated
{
    UIWindow *window = [self getCurrentWindow];
    if (animated) {
        [UIView transitionFromView:window.rootViewController.view toView:viewController.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            window.rootViewController = viewController;
            [window makeKeyAndVisible];
        }];
    }else{
        window.rootViewController = viewController;
        [window makeKeyAndVisible];
    }
    return window;
}

+ (UIWindow *)getCurrentWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isMemberOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}

@end
