//
//  SEELoginModel.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

@protocol DataModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : JSONModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *number;

@end


@interface SEELoginModel : JSONModel

@property (nonatomic, assign) int status;
@property (nonatomic, strong) DataModel *data;

@end




NS_ASSUME_NONNULL_END
