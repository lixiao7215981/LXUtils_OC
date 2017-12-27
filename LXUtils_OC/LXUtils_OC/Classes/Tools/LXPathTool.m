//
//  LXPatchTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXPathTool.h"

@implementation LXPathTool

+ (NSString *)getUserDataPath
{
    return [[LXPathTool getApplicationDocumentsDirectory] stringByAppendingPathComponent:@"User.data"];
}

+ (NSString *)getApplicationDocumentsDirectory {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

+ (BOOL)haveFolderPath:(NSString *)path Create:(BOOL)isCreate
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if(!(isDirExist && isDir)){
        if (isCreate) {
            BOOL bCreateDir = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
            if(!bCreateDir){
                NSLog(@"创建%@路径失败",path);
            }
        }
        return NO;
    }
    return YES;
}

+ (BOOL)haveFilePath:(NSString *)path Create:(BOOL)isCreate
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        if (isCreate) {
            [fileManager createFileAtPath:path contents:nil attributes:nil];
        }
        return NO;
    }
    return YES;
}


@end
