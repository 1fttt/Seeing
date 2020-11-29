//
//  Manager.m
//  Seeing
//
//  Created by 房彤 on 2020/11/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "Manager.h"
#import "AFNetworking.h"
#import "SEERegisterModel.h"

@implementation Manager

static Manager *manager = nil;

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[Manager alloc] init];
        }
    });
    return manager;
}

- (void)registerName:(NSString *)nameStr andNumber:(NSString *)numberStr andPass:(NSString *)passStr getBackModel:(RegisterBackBlock)succeedBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    AFmanager.requestSerializer = [AFJSONRequestSerializer serializer]; // 请求JSON格式
    AFmanager.responseSerializer = [AFJSONResponseSerializer serializer]; // 响应JSON格式
    
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *url = @"http://47.100.138.22:8082/volunteer/register";
    NSDictionary *parameters = @{@"name":nameStr, @"phone":numberStr, @"password":passStr};
    

    [AFmanager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"注册成功");
        SEERegisterModel *registerModel = [[SEERegisterModel alloc]initWithDictionary:responseObject error:nil];
        
        succeedBlock(registerModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"注册失败");
    }];
    

    
}


@end
