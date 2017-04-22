//
//  RCCHTTPRequest.h
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError *error);


@interface RCCHTTPRequest : NSObject

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
**/
+ (void)get:(NSString *)url params:(NSDictionary *)params seccess:(SuccessBlock)success failure:(FailureBlock)failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params seccess:(SuccessBlock)success failure:(FailureBlock)failure;
@end
