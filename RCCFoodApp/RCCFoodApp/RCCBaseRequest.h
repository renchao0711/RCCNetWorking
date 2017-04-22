//
//  RCCBaseRequest.h
//  RCCFoodApp
//
//  Created by 任超 on 17/4/21.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseObject);
typedef void(^Failure)(NSError *error);
typedef void(^Warning)(NSString *warning);
typedef void(^tokenInvalid)();

@interface RCCBaseRequest : NSObject

/**
 *  1.返回result 数据模型
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param modelClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warning         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
**/
+(void)getModelWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock) success warn:(Warning)warning failure:(Failure) failure tokenInvalid:(tokenInvalid) tokenInvalid;

+(void)postModelWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock) success warn:(Warning)warning failure:(Failure) failure tokenInvalid:(tokenInvalid) tokenInvalid;

/**
 *  2.返回result 数据模型(带HUD)
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param modelClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warning         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
 **/
+(void)getModelHUDWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock) success warn:(Warning)warning failure:(Failure) failure tokenInvalid:(tokenInvalid) tokenInvalid;

+(void)postModelHUDWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock) success warn:(Warning)warning failure:(Failure) failure tokenInvalid:(tokenInvalid) tokenInvalid;

@end
