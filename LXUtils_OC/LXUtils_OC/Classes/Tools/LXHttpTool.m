//
//  LXHttpTool.m
//  lXUtils_OC
//
//  Created by Xiao.Li on 2017/12/25.
//  Copyright © 2017年 LXUtils. All rights reserved.
//

#import "LXHttpTool.h"

@implementation LXHttpTool

/** 请求超时时间 **/
static NSTimeInterval const defaultRequestTimeout = 60;
/** 上传数据超时时间 **/
static NSTimeInterval const defaultUploadTimeout = 60;


/** ---------------------------AFNetWorking GET 方法------------------------------- **/
+ (NSURLSessionDataTask *) HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser timeoutInterval:(NSTimeInterval)timeout requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (timeout) {
        manager.requestSerializer.timeoutInterval = timeout;
    }
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    NSURLSessionDataTask * task = [manager GET:url parameters:parameser progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask * task = [LXHttpTool HttpToolGetWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:HTTPResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask * task =  [LXHttpTool HttpToolGetWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask * task = [LXHttpTool HttpToolGetWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:header Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

/** ---------------------------AFNetWorking POST 方法------------------------------- **/

+ (NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser timeoutInterval:(NSTimeInterval)timeout requestHeaderField:(NSDictionary *)header Data:(NSData *)data Name:(NSString *)name FileName:(NSString *)fileName MainType:(NSString *)mainType Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (timeout) {
        manager.requestSerializer.timeoutInterval = timeout;
    }
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    if (data) {
        NSURLSessionDataTask *task = [manager POST:url parameters:parameser constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:data name:name fileName:fileName mimeType:mainType];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
        return task;
    }else{
        NSURLSessionDataTask *task = [manager POST:url parameters:parameser progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
        return task;
    }
}

+ (NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPostWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Data:nil Name:nil FileName:nil MainType:nil Serializer:HTTPResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}



+ (NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPostWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Data:nil Name:nil FileName:nil MainType:nil Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+(NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPostWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:header Data:nil Name:nil FileName:nil MainType:nil Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Data:(NSData *)data Name:(NSString *)name FileName:(NSString *)fileName MainType:(NSString *)mainType Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPostWithUrl:url paramesers:parameser timeoutInterval:defaultUploadTimeout requestHeaderField:nil Data:data Name:name FileName:fileName MainType:mainType Serializer:JSONResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser requestHeaderField:(NSDictionary *)header Data:(NSData *)data Name:(NSString *)name FileName:(NSString *)fileName MainType:(NSString *)mainType Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPostWithUrl:url paramesers:parameser timeoutInterval:defaultUploadTimeout requestHeaderField:header Data:data Name:name FileName:fileName MainType:mainType Serializer:JSONResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

/** ---------------------------AFNetWorking PUT 方法------------------------------- **/

+ (NSURLSessionDataTask *) HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser timeoutInterval:(NSTimeInterval)timeout requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (timeout) {
        manager.requestSerializer.timeoutInterval = timeout;
    }
    
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    NSURLSessionDataTask *task = [manager PUT:url parameters:parameser success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPutWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:HTTPResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPutWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolPutWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:header Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

/** ---------------------------AFNetWorking DELETE 方法------------------------------- **/

+ (NSURLSessionDataTask *) HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser timeoutInterval:(NSTimeInterval)timeout requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (timeout) {
        manager.requestSerializer.timeoutInterval = timeout;
    }
    
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    NSURLSessionDataTask *task = [manager DELETE:url parameters:parameser success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolDeleteWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:HTTPResponseSerializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolDeleteWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:nil Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}

+ (NSURLSessionDataTask *) HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser requestHeaderField:(NSDictionary *)header Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSURLSessionDataTask *task = [LXHttpTool HttpToolDeleteWithUrl:url paramesers:parameser timeoutInterval:defaultRequestTimeout requestHeaderField:header Serializer:serializer Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return task;
}


@end
