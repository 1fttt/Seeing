//
//  SEEForgetModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEForgetModel : JSONModel

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *msg;

@end


@interface SEEVerifyModel : JSONModel

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *msg;

@end

NS_ASSUME_NONNULL_END
