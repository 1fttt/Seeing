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
#import "SEEBlindPersonalCentreModel.h"
#import "SEEBlindContactModel.h"
#import "SEEBlindWeatherModel.h"

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
        errorBlock(error);
    }];
    
}

//验证验证码
- (void)getVerifyPhoneNumber:(NSString *)numberStr andCode:(NSString *)codeStr getBackVerifyModel:(VerifyBackBlock)succeedBlock error:(ErrorBlock)errorBlock {
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/verify";
       
    NSDictionary *parameters = @{@"phone":numberStr, @"code":codeStr};
    
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEVerifyModel *verifyModel = [[SEEVerifyModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(verifyModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)getPhoneNumber:(NSString *)numberStr andNewPassword:(NSString *)password getBackresetModel:(ResetPasswordBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *url = @"http://47.100.138.22:8082/user/reset_password";
    
    NSDictionary *parameters = @{@"phone":numberStr, @"newPassword":password};
    
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEResetPasswordModel *resetModel = [[SEEResetPasswordModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(resetModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
}

//登录时修改密码
- (void)getID:(NSString *)idStr andOldPassword:(NSString *)oldStr angNewPassword:(NSString *)passwordStr getbackUpdateBlock:(UpdatePasswordBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@" application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/updatePwd";
    NSDictionary *paremeters = @{@"id":idStr, @"password":oldStr, @"newPassword":passwordStr};
    
    [AFmanager POST:url parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEResetPasswordModel *updateModel = [[SEEResetPasswordModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(updateModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}



//获取紧急联系人
- (void)getContactBlock:(ContactBlock)succeedBlock error:(ErrorBlock)errorBlock andBlindID:(NSString *)idStr {
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@" application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/contact/lists";
    NSDictionary *paremeters = @{@"blind":idStr};
    
    [AFmanager POST:url parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"紧急联系人请求成功");
        
        SEEBlindContactModel *contactModel = [[SEEBlindContactModel alloc] initWithDictionary:responseObject error:nil];
        NSLog(@"%@", contactModel.msg);
        
        succeedBlock(contactModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"紧急联系人请求失败");
    }];
}

- (void)addContactBlock:(ContactBackBlock)succeedBlock error:(ErrorBlock)errorBlock andBlindID:(NSString *)idStr andName:(NSString *)nameStr andRelation:(NSString *)relationStr andPhone:(NSString *)phoneStr {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@" application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/contact/add";
    NSDictionary *paremeters = @{@"user":idStr, @"name":nameStr, @"phone":phoneStr, @"relation":relationStr};
    
    [AFmanager POST:url parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"紧急联系人添加成功");
        
        SEEForgetModel *contactBackModel = [[SEEForgetModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(contactBackModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"紧急联系人请求失败");
    }];
}


//完善修改信息
- (void)updateInfBlock:(UpdateInfBlock)succeedBlock andName:(NSString *)name andIdStr:(NSString *)idStr andMsg:(NSString *)msgStr andGender:(NSString *)genderStr andEmail:(NSString *)emailStr andPhone:(NSString *)phoneStr andAddress:(NSString *)addressStr {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@" application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://47.100.138.22:8082/user/updateInf";
    NSDictionary *paremeters = @{@"id":idStr, @"msg":msgStr, @"gender":genderStr, @"address":addressStr, @"email":emailStr, @"phone":phoneStr};
    
    [AFmanager POST:url parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"修改信息请求成功");
        
        SEEBlindPersonalCentreModel *upDateInfModel = [[SEEBlindPersonalCentreModel alloc] initWithDictionary:responseObject error:nil];
        
        succeedBlock(upDateInfModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"修改信息请求失败");
    }];
    
}




- (void)getWeatherBlock:(WeatherBlock)succeedBlock andCityStr:(NSString *)cityStr {
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    //NSString *url = [NSString stringWithFormat:@"https://tianqiapi.com/api?version=v6&appid=42835475&appsecret=n013OP8H&city=%@", cityStr];
    NSString *url = @"https://tianqiapi.com/api?";
    NSDictionary *dic = @{@"version":@"v6", @"appid":@"42835475", @"appsecret":@"n013OP8H", @"city":cityStr};
    [AFmanager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"天气请求发送成功");
        SEEBlindWeatherModel *weatherModel = [[SEEBlindWeatherModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(weatherModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"天气请求发送失败");
    }];
}


@end
