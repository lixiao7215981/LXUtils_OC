//
//  UIImage+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
/**
 *  缩放图片
 */
- (UIImage *)scaleToSize:(CGSize)size;
/**
 *  等比例缩放图片
 */
- (UIImage *)scaleToEqualSize:(CGSize)size;
/**
 *  截取部分图像
 */
- (UIImage *)subImageInRect:(CGRect)rect;
/**
 *  缩放从顶部开始平铺图片
 */
- (UIImage *)imageScaleAspectFillFromTop:(CGSize)frameSize;
/**
 *  填充尺寸的缩略图
 */
- (UIImage *)imageFillSize:(CGSize)viewsize;
/**
 *  生成纯色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  根据传入大小生成纯色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color WithSize:(CGSize)size;
/**
 *  按照比例旋转图片，将图片摆正
 */
- (UIImage *)scaleAndRotateImage;

@end
