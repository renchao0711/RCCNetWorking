//
//  RCCHTTPSessionManager.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCCHTTPSessionManager.h"

@implementation RCCHTTPSessionManager

+ (instancetype)manager{
    
    RCCHTTPSessionManager *manager = [super manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //[manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    return manager;
}

@end
