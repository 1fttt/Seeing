//
//  SEEBlindPersonalCentreModel.m
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalCentreModel.h"

@implementation SEEBlindPersonalCentreModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation UpdateInfModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

@end

