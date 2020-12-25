//
//  SEEBlindContactModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PersonModel

@end



@interface PersonModel : JSONModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *relation;

@end



@interface SEEBlindContactModel : JSONModel

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<PersonModel> *data;


@end

NS_ASSUME_NONNULL_END
