//
//  SEEBlindPersonalCentreModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpdateInfModel


@end


@interface UpdateInfModel : JSONModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *number;

@end



@interface SEEBlindPersonalCentreModel : JSONModel

@property (nonatomic, assign) int status;
@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) UpdateInfModel *data;

@end




NS_ASSUME_NONNULL_END
