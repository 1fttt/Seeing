//
//  SEEBlindWeatherModel.h
//  Seeing
//
//  Created by 房彤 on 2020/12/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Stories

@end

@interface SEEBlindWeatherModel : JSONModel

@property (nonatomic, copy) NSString *tem;
@property (nonatomic, copy) NSString *tem1;
@property (nonatomic, copy) NSString *tem2;
@property (nonatomic, copy) NSString *wea_img;
@property (nonatomic, copy) NSString *wea;


@end


@interface Stories : JSONModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, copy) NSString *ID;

@end

@interface SEEBlindStoryModel : JSONModel

@property NSArray<Stories> *stories;

@end

NS_ASSUME_NONNULL_END

