//
//  Manager.h
//  Seeing
//
//  Created by 房彤 on 2020/11/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SEERegisterModel;
@class SEELoginModel;
@class SEEForgetModel;
@class SEEVerifyModel;
@class SEEResetPasswordModel;
@class SEEBlindPersonalCentreModel;
@class SEEBlindContactModel;
@class SEEBlindWeatherModel;
@class SEEBlindImageModel;
@class SEEBlindStoryModel;

NS_ASSUME_NONNULL_BEGIN

typedef void (^RegisterBackBlock)(SEERegisterModel *registerBackModel);
typedef void (^LoginBackBlock)(SEELoginModel *loginBackModel);

typedef void (^VerifyBlock)(SEEForgetModel *forgetModel);
typedef void (^VerifyBackBlock)(SEEVerifyModel *verifyModel);

typedef void (^ResetPasswordBlock)(SEEResetPasswordModel *resetModel);
typedef void (^UpdatePasswordBlock)(SEEResetPasswordModel *updateModel);

typedef void (^ContactBlock)(SEEBlindContactModel *contactModel);
typedef void (^ContactBackBlock)(SEEForgetModel *contactBackModel);

typedef void (^UpdateInfBlock)(SEEBlindPersonalCentreModel *updateInfModel);

//天气block
typedef void (^WeatherBlock)(SEEBlindWeatherModel *weatherModel);

//头像上传
typedef void (^ImageBlock)(SEEBlindImageModel *imageModel);

typedef void (^StoryBlock)(SEEBlindStoryModel *storyModel);




typedef void (^ErrorBlock)(NSError *error);



@interface Manager : NSObject

+ (instancetype)shareManager;

//注册
- (void)registerTypeStr:(NSString *)personStr andName:(NSString *)nameStr andNumber:(NSString *)numberStr andPass:(NSString *)passStr getBackModel:(RegisterBackBlock)succeedBlock error:(ErrorBlock)errorBlock;

//登录
- (void)loginPhoneNumber:(NSString *)numberStr andPasswordStr:(NSString *)passwordStr getBackModel:(LoginBackBlock)succeedBlock error:(ErrorBlock)errorBlock;

//发送验证码
- (void)forgetPhoneNumber:(NSString *)numberStr getForgetModel:(VerifyBlock)succeedBlock error:(ErrorBlock)errorBlock;

//验证验证码
- (void)getVerifyPhoneNumber:(NSString *)numberStr andCode:(NSString *)codeStr getBackVerifyModel:(VerifyBackBlock)succeedBlock error:(ErrorBlock)errorBlock;

//重置密码
- (void)getPhoneNumber:(NSString *)numberStr andNewPassword:(NSString *)password getBackresetModel:(ResetPasswordBlock)succeedBlock error:(ErrorBlock)errorBlock;

//登录时修改密码
- (void)getID:(NSString *)idStr andOldPassword:(NSString *)oldStr angNewPassword:(NSString *)passwordStr getbackUpdateBlock:(UpdatePasswordBlock)succeedBlock error:(ErrorBlock)errorBlock;


//获取紧急联系人
- (void)getContactBlock:(ContactBlock)succeedBlock error:(ErrorBlock)errorBlock andBlindID:(NSString *)idStr;

//添加紧急联系人
- (void)addContactBlock:(ContactBackBlock)succeedBlock error:(ErrorBlock)errorBlock andBlindID:(NSString *)idStr andName:(NSString *)nameStr andRelation:(NSString *)relationStr andPhone:(NSString *)phoneStr;


//修改完善信息
- (void)updateInfBlock:(UpdateInfBlock)succeedBlock andName:(NSString *)name andIdStr:(NSString *)idStr andMsg:(NSString *)msgStr andGender:(NSString *)genderStr andEmail:(NSString *)emailStr andPhone:(NSString *)phoneStr andAddress:(NSString *)addressStr;




//获取天气
- (void)getWeatherBlock:(WeatherBlock)succeedBlock andCityStr:(NSString *)cityStr;

//上传头像 获取头像url
- (void)getImageBlock:(ImageBlock)succeedBlock andID:(NSString *)idStr andImageData:(NSData *)imageData;


- (void)getStoryBlock:(StoryBlock)succeedBlock;


@end

NS_ASSUME_NONNULL_END
