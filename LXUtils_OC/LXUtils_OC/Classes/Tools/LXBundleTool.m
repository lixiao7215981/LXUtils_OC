//
//  LXBundleTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXBundleTool.h"
#import "LXUtilsDefine.h"

@implementation LXBundleTool

+ (UIImage *)getImage:(NSString *)name FromBundle:(NSString *)bundle
{
    NSMutableString *imgName = [NSMutableString stringWithString:name];
    if (SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        [imgName appendString:@".png"];
    }
    UIImage *image=[UIImage imageWithContentsOfFile:[BUNDLE_PATH(bundle) stringByAppendingPathComponent : imgName]];
    return image;
}

+ (id)getViewControllerNibName:(NSString *)name FromBundle:(NSString *)bundle
{
    Class vc = NSClassFromString(name);
    return [[vc alloc] initWithNibName:name bundle:[NSBundle bundleWithPath: BUNDLE_PATH(bundle)]];
}

+ (NSData *)getFileDataWithName:(NSString *)name FromBundle:(NSString *)bundle
{
    return [NSData dataWithContentsOfFile:[BUNDLE_PATH(bundle) stringByAppendingPathComponent :name]];
}

+ (NSArray *)getArrayWithName:(NSString *)name FromBundle:(NSString *)bundle
{
    return [NSArray arrayWithContentsOfFile:[BUNDLE_PATH(bundle) stringByAppendingPathComponent :name]];
}

@end
