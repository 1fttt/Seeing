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
#import "SEELoginModel.h"
#import "SEEForgetModel.h"

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


- (void)registerTypeStr:(NSString *)typeStr andName:(NSString *)nameStr andNumber:(NSString *)numberStr andPass:(NSString *)passStr getBackModel:(RegisterBackBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];

    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/register";
    //NSString *url = @"http://47.100.138.22:8082/blind/register";
    NSDictionary *parameters = @{@"name":nameStr, @"phone":numberStr, @"password":passStr, @"type":typeStr};
    
    [AFmanager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEERegisterModel *registerModel = [[SEERegisterModel alloc]initWithDictionary:responseObject error:nil];
        NSLog(@"%@", registerModel.msg);
        
        succeedBlock(registerModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        errorBlock(error);
    }];
        
}

- (void)loginPhoneNumber:(NSString *)numberStr andPasswordStr:(NSString *)passwordStr getBackModel:(LoginBackBlock)succeedBlock error:(ErrorBlock)errorBlock {
 
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *url = @"http://47.100.138.22:8082/user/login";
    
    NSDictionary *parameters = @{@"phone":numberStr, @"password":passwordStr};
    
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEELoginModel *model = [[SEELoginModel alloc] initWithDictionary:responseObject error:nil];
        NSLog(@"%@", model.msg);
        succeedBlock(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败");
        errorBlock(error);
    }];
    
    

}


//发送验证码
- (void)forgetPhoneNumber:(NSString *)numberStr getForgetModel:(VerifyBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/forget";
    NSDictionary *parameters = @{@"phone":numberStr};
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEForgetModel *forgetModel = [[SEEForgetModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(forgetModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
}

//验证验证码
- (void)getVerifyPhoneNumber:(NSString *)numberStr andCode:(NSString *)codeStr getBacVerifyModel:(VerifyBackBlock)succeedBlock error:(ErrorBlock)errorBlock {
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/reset_password";
    NSDictionary *parameters = @{@"phone":numberStr, @"code":codeStr};
    
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SEEVerifyModel *verifyModel = [[SEEVerifyModel alloc] initWithDictionary:responseObject error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}



@end
