//
//  SEEBlindContactModel.m
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindContactModel.h"

@implementation SEEBlindContactModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end


@implementation PersonModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID":@"id"}];
}

@end
