//
//  Manager.h
//  Seeing
//
//  Created by 房彤 on 2020/11/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SEERegisterModel;
NS_ASSUME_NONNULL_BEGIN

typedef void (^RegisterBackBlock)(SEERegisterModel *registerBackModel);


@interface Manager : NSObject

+ (instancetype)shareManager;

- (void)registerName:(NSString *)nameStr andNumber:(NSString *)numberStr andPass:(NSString *)pass getBackModel:(RegisterBackBlock)succeedBlock;


@end

NS_ASSUME_NONNULL_END
