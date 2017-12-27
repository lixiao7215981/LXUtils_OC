//
//  UIView+Category.h
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;



typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
/**
 
 给 View 添加 boarder 上下左右
 
 用法：
 UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 80.0f, 200.0f, 100.0f)];
 testView.backgroundColor = [UIColor lightGrayColor];
 [self.view addSubview:testView];
 [self borderForView:testView color:[UIColor redColor] borderWidth:1.0f borderType:UIBorderSideTypeTop | UIBorderSideTypeBottom];
 
 */
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;


@end
