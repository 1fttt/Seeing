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

NS_ASSUME_NONNULL_BEGIN

typedef void (^RegisterBackBlock)(SEERegisterModel *registerBackModel);
typedef void (^LoginBackBlock)(SEELoginModel *loginBackModel);

typedef void (^VerifyBlock)(SEEForgetModel *forgetModel);
typedef void (^VerifyBackBlock)(SEEVerifyModel *verifyModel);

typedef void (^ResetPasswordBlock)(SEEResetPasswordModel *resetModel);
typedef void (^UpdatePasswordBlock)(SEEResetPasswordModel *updateModel);

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

@end

NS_ASSUME_NONNULL_END
