//
//  SEERegisterModel.h
//  Seeing
//
//  Created by 房彤 on 2020/11/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEERegisterModel : JSONModel

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *msg;

@end

NS_ASSUME_NONNULL_END
