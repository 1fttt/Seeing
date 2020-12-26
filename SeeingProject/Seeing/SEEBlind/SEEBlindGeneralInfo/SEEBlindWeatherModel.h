//
//  SEEBlindWeatherModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindWeatherModel : JSONModel

@property (nonatomic, copy) NSString *tem;
@property (nonatomic, copy) NSString *tem1;
@property (nonatomic, copy) NSString *tem2;
@property (nonatomic, copy) NSString *wea_img;
@property (nonatomic, copy) NSString *wea;
@end

NS_ASSUME_NONNULL_END
