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
#import "SEEBlindImageModel.h"
#import "NSString+NSString_md5.h"
#import "SEEBlindScanModel.h"


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
    NSString *url = @"http://106.14.32.152:8082/user/register";
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
    
    NSString *url = @"http://106.14.32.152:8082/user/login";
    
    NSDictionary *parameters = @{@"phone":numberStr, @"password":passwordStr};
    
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEELoginModel *model = [[SEELoginModel alloc] initWithDictionary:responseObject error:nil];
        NSLog(@"%@", model.msg);
        succeedBlock(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败%@", error);
        errorBlock(error);
    }];
    
    

}


//发送验证码
- (void)forgetPhoneNumber:(NSString *)numberStr getForgetModel:(VerifyBlock)succeedBlock error:(ErrorBlock)errorBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://106.14.32.152:8082/user/forget";
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
    NSString *url = @"http://106.14.32.152:8082/user/verify";
       
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
    
    NSString *url = @"http://106.14.32.152:8082/user/reset_password";
    
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
    NSString *url = @"http://106.14.32.152:8082/user/updatePwd";
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
    NSString *url = @"http://106.14.32.152:8082/contact/lists";
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
    NSString *url = @"http://106.14.32.152:8082/contact/add";
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
- (void)updateInfBlock:(UpdateInfBlock)succeedBlock andName:(NSString *)nameStr andIdStr:(NSString *)idStr andMsg:(NSString *)msgStr andGender:(NSString *)genderStr andEmail:(NSString *)emailStr andPhone:(NSString *)phoneStr andAddress:(NSString *)addressStr {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    [AFmanager.requestSerializer setValue:@" application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    NSString *url = @"http://106.14.32.152:8082/user/updateInf";
    NSDictionary *paremeters = @{@"name":nameStr, @"id":idStr, @"msg":msgStr, @"gender":genderStr, @"address":addressStr, @"email":emailStr, @"phone":phoneStr};
    
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

- (void)getImageBlock:(ImageBlock)succeedBlock andID:(NSString *)idStr andImageData:(NSData *)imageData {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    
    
    NSString *url = @"http://106.14.32.152:8082/user/image";
    

    AFmanager.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFmanager.responseSerializer = [AFJSONResponseSerializer serializer];

    [AFmanager POST:url parameters:@{@"id":idStr} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //NSString *imageBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        //NSLog(@"%@", imageBase64);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        NSLog(@"filename:%@", fileName);
        
        //[NSString stringWithFormat:@"%@.png", idStr]
        
        [formData appendPartWithFileData:imageData name:@"image_file" fileName:fileName mimeType:@"image/png"];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"请求发送成功");
        
        SEEBlindImageModel *imageModel = [[SEEBlindImageModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(imageModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
}



- (void)getStoryBlock:(StoryBlock)succeedBlock {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/latest"];
    [AFmanager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEBlindStoryModel *storyModel = [[SEEBlindStoryModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(storyModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}


- (void)getScanBlock:(ScanBlock)succeedBlock andImageData:(NSData *)imageData {
    
    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
    NSString *url = @"https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general";
    //25.2ac27ef8472b45c2d692672de4b3dac6.315360000.1931153676.282335-23799479
    NSString *imageBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    

    NSDictionary *parameters = @{@"access_token":@"24.50246e043bea7ee955e8aec3ecfa8c06.2592000.1618386070.282335-23799479", @"Content-Type":@"application/x-www-form-urlencoded", @"image":imageBase64};
    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        SEEBlindScanBDModel *model = [[SEEBlindScanBDModel alloc] initWithDictionary:responseObject error:nil];
        
        NSLog(@"%@", [model.result[0] keyword]);
        succeedBlock(model);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
        
    }];
    
}

//
//- (void)getScanBlock:(ScanBlock)succeedBlock andImageData:(NSData *)imageData {
//    AFHTTPSessionManager *AFmanager = [AFHTTPSessionManager manager];
//
//    AFmanager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/plain",  nil];
//
//    NSString *url = @"http://tupapi.xfyun.cn/v1/currency";
//
//
////    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
////    NSString *stringBase64 = [data base64EncodedStringWithOptions:NSUTF8StringEncoding]; // base64格式的字符串
//
//    //NSString *imageBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//
//    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
//    long long dTime = [[NSNumber numberWithDouble:time] longLongValue]; // 将double转为long long型
//    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
//
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyyMMddHHmmss";
//    NSString *str = [formatter stringFromDate:[NSDate date]];
//    NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
//    NSLog(@"filename:%@", fileName);
//    //NSString *fileName = @"image.jpg";
//
//    NSDictionary *param = @{@"image_name":fileName, @"image_url":@""};
//    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted  error:nil];
//
//    NSString *imageBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//
//    NSString *md5 = [[NSString stringWithFormat:@"5feb210e%@%@", curTime, imageBase64] md5String];
//
//    NSLog(@"%@", md5);
//
//    NSDictionary *parameters = @{@"X-Appid":@"5feb210e", @"X-CurTime":curTime, @"X-Param":imageBase64, @"X-CheckSum":md5};
//    [AFmanager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
////        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
////        formatter.dateFormat = @"yyyyMMddHHmmss";
////        NSString *str = [formatter stringFromDate:[NSDate date]];
////        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
////        NSLog(@"filename:%@", fileName);
//
//        //[NSString stringWithFormat:@"%@.png", idStr]
//
//        [formData appendPartWithFileData:imageData name:@"image_name" fileName:fileName mimeType:@"image/jpg"];
//
//        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            NSLog(@"%@", responseObject);
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@", error);
//        }];
//
//
//
////    [AFmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////
////        NSLog(@"111");
////
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        NSLog(@"0000000%@", error);
////    }];
//
////    [AFmanager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
////        [formData appendPartWithFileData:imageData name:@"image_file" fileName:@"a.png" mimeType:@"image/png"];
////    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        NSLog(@"0000000%@", error);
////    }];
//
//
//
//    /*
//    APPID
//    5feb210e
//    APIKey
//    b60a3f8e32350f771acb759e69a7de3c
//     */
//
//
//}


- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    NSURLCredential *card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
}

@end
