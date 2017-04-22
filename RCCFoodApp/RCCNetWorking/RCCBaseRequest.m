//
//  RCCBaseRequest.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/21.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCCBaseRequest.h"
#import "RCCHTTPRequest.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"

@implementation RCCBaseRequest

//1.不带HUD
+(void)getModelWithURL:(NSString *)url
                 param:(id)param
                 model:(Class)modelClass
               success:(SuccessBlock)success
                  warn:(Warning)warning
               failure:(Failure)failure
          tokenInvalid:(tokenInvalid)tokenInvalid{
    
    [self getBaseWithURL:url param:param model:modelClass success:^(id responseObject) {
        if (!modelClass) {
            success(nil);
            return;
        }
        success([modelClass mj_objectArrayWithKeyValuesArray:responseObject]);
    } warn:warning failure:failure tokenInvalid:tokenInvalid];
}

+(void)getBaseWithURL:(NSString *)url
                param:(id)param
                model:(Class)modelClass
              success:(SuccessBlock)success
                 warn:(Warning)warning
              failure:(Failure)failure
         tokenInvalid:(tokenInvalid)tokenInvalid{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [RCCHTTPRequest get:url params:param seccess:^(id responseObject) {
        if (success) {
            //NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"response-----%@",responseObject);
            success(responseObject);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    } failure:^(NSError *error) {
        NSLog(@"error-----%@",error);
        failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

+(void)postModelWithURL:(NSString *)url
                  param:(id)param
                  model:(Class)modelClass
                success:(SuccessBlock)success
                   warn:(Warning)warning
                failure:(Failure)failure
           tokenInvalid:(tokenInvalid)tokenInvalid{
    
    [self postBaseWithURL:url param:param model:modelClass success:^(id responseObject) {
        if (!modelClass) {
            success(nil);
            return ;
        }
        success([modelClass mj_objectArrayWithKeyValuesArray:responseObject]);
    } warn:warning failure:failure tokenInvalid:tokenInvalid];
}

+(void)postBaseWithURL:(NSString *)url
                param:(id)param
                model:(Class)modelClass
              success:(SuccessBlock)success
                 warn:(Warning)warning
              failure:(Failure)failure
          tokenInvalid:(tokenInvalid)tokenInvalid{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    [RCCHTTPRequest post:url params:param seccess:^(id responseObject) {
        if (success) {
            NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(dicData);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"response-----%@",responseObject);
    } failure:^(NSError *error) {
        failure(error);
        NSLog(@"error-----%@",error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    }];
}

//2.带HUD
+(void)getModelHUDWithURL:(NSString *)url
                    param:(id)param
                    model:(Class)modelClass
                  success:(SuccessBlock) success
                     warn:(Warning)warning
                  failure:(Failure)failure
             tokenInvalid:(tokenInvalid) tokenInvalid{
    
    [self getBaseModelHUDWithURL:url param:param model:modelClass success:success
     warn:warning failure:failure tokenInvalid:tokenInvalid];
    
    
}

+(void)getBaseModelHUDWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock)success warn:(Warning)warning failure:(Failure)failure tokenInvalid:(tokenInvalid) tokenInvalid{
    
    [SVProgressHUD showWithStatus:@"加载中"];
    
    [self getBaseWithURL:url param:param model:modelClass success:^(id responseObject) {
        [SVProgressHUD dismiss];
        success(responseObject);
    } warn:^(NSString *warningStr) {
        [SVProgressHUD dismiss];
        warning(warningStr);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
        failure(error);
    } tokenInvalid:^{
        [SVProgressHUD dismiss];
        tokenInvalid();
    }];
}

+(void)postModelHUDWithURL:(NSString *)url
                     param:(id)param
                     model:(Class)modelClass
                   success:(SuccessBlock)success
                      warn:(Warning)warning
                   failure:(Failure)failure
              tokenInvalid:(tokenInvalid)tokenInvalid{
    
    [self postBaseModelHUDWithURL:url param:param model:modelClass success:^(id responseObject) {
//        if(!modelClass){
//            success(nil);
//            return ;
//        }
//        success([modelClass mj_objectArrayWithKeyValuesArray:responseObject]);
        success(responseObject);
    } warn:warning failure:failure tokenInvalid:tokenInvalid];
}

+(void)postBaseModelHUDWithURL:(NSString *)url param:(id)param model:(Class)modelClass success:(SuccessBlock) success warn:(Warning)warning failure:(Failure) failure tokenInvalid:(tokenInvalid) tokenInvalid{
    
    [self postBaseWithURL:param param:param model:modelClass success:^(id responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"请求成功"];
    } warn:^(NSString *warningStr) {
        [SVProgressHUD dismiss];
        warning(warningStr);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    } tokenInvalid:^{
        [SVProgressHUD dismiss];
        tokenInvalid();
    }];
}
@end
