//
//  SEEBlindWeatherModel.m
//  Seeing
//
//  Created by 房彤 on 2020/12/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindWeatherModel.h"

@implementation SEEBlindWeatherModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end


@implementation Stories

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

@end

@implementation SEEBlindStoryModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

