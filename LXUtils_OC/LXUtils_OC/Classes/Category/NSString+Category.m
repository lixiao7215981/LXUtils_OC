//
//  NSString+Category.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/27.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+ (NSString*)encodeBase64String:(NSString *)input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString*)decodeBase64String:(NSString * )input {
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:input options:0];
    NSString *base64Decoded = [[NSString alloc] initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    return base64Decoded;
}

+ (NSString*)encodeBase64Data:(NSData *)data {
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    return [NSString stringWithUTF8String:[base64Data bytes]];
}

+ (NSString*)decodeBase64Data:(NSData *)base64Data {
    NSData *nsdataDecoded = [base64Data initWithBase64EncodedData:base64Data options:0];
    return [[NSString alloc] initWithData:nsdataDecoded encoding:NSUTF8StringEncoding];
}

- (NSString *)toStringFromHexString
{
    char *myBuffer = (char *)malloc((int)[self length] / 2 + 1);
    bzero(myBuffer, [self length] / 2 + 1);
    for (int i = 0; i < [self length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    return unicodeString;
}

- (NSString *)toHexStringFromString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [self toHexStringFromData:data];
}

- (NSString *)toHexStringFromBase64String
{
    NSData *base64 = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [self toHexStringFromData:base64];
}

- (NSString *) toHexStringFromData:(NSData *) data
{
    Byte *bytes = (Byte *)[data bytes];
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++){
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

- (NSAttributedString *)toMoneyString
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr insertAttributedString:[[NSAttributedString alloc] initWithString:@"￥" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]}] atIndex:0];
    return attrStr;
}

- (NSString *)toClearBlankString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (CGSize) sizeWithFont:(UIFont *) font
{
    return [self sizeWithFont:font Width:MAXFLOAT];
}

- (CGSize) sizeWithFont:(UIFont *)font Width:(CGFloat) width
{
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

- (NSString *)encodeToPercentEscapeString
{
    NSString *outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef)self,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8);
    CFRelease((__bridge CFTypeRef)(outputStr));
    return outputStr;
}

- (NSString *)decodeFromPercentEscapeString
{
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+" withString:@"" options:NSLiteralSearch range:NSMakeRange(0,[outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

-(NSString*) removeStringFrontZero
{
    NSString *str = self;
    while ([str hasPrefix:@"0"]){
        str = [str substringFromIndex:1];
    }
    return str;
}

-(NSData*) stringHexToBytes {
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= self.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [self substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

// 64base字符串转图片
- (UIImage *)stringToImage:(NSString *)str
{
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    return photo;
}

// 图片转64base字符串
- (NSString *)imageToString:(UIImage *)image
{
    NSData *imagedata = UIImagePNGRepresentation(image);
    NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return image64;
}

@end
