//
//  CALayer+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CALayer (Category)

/**
 *  XIB 当中设置borderColor
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
