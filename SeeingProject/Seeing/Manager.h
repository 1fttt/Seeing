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

NS_ASSUME_NONNULL_BEGIN

typedef void (^RegisterBackBlock)(SEERegisterModel *registerBackModel);
typedef void (^LoginBackBlock)(SEELoginModel *loginBackModel);
typedef void (^ErrorBlock)(NSError *error);

@interface Manager : NSObject

+ (instancetype)shareManager;

//注册
- (void)registerTypeStr:(NSString *)personStr andName:(NSString *)nameStr andNumber:(NSString *)numberStr andPass:(NSString *)passStr getBackModel:(RegisterBackBlock)succeedBlock error:(ErrorBlock)errorBlock;

//登录
- (void)loginPhoneNumber:(NSString *)numberStr andPasswordStr:(NSString *)passwordStr getBackModel:(LoginBackBlock)succeedBlock error:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
