//
//  SEEBlindImageModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/27.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

@protocol SEEBlindImageDataModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindImageDataModel : JSONModel

@property (nonatomic, copy) NSString *uri;
@property (nonatomic, copy) NSString *url;

@end


@interface SEEBlindImageModel : JSONModel

@property (nonatomic, assign) int status;
@property (nonatomic, strong) SEEBlindImageDataModel *data;


@end

NS_ASSUME_NONNULL_END
