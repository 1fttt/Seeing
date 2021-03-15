//
//  SEEBlindScanModel.h
//  Seeing
//
//  Created by 房彤 on 2021/1/2.
//  Copyright © 2021 房彤. All rights reserved.
//

#import "JSONModel.h"

@protocol SEEBlindScanDataModel

@end



@protocol SEEBlindScanTokenModel

@end

@protocol SEEBlindScanBDResultModel <NSObject>


@end

NS_ASSUME_NONNULL_BEGIN


@interface SEEBlindScanDataModel : JSONModel

@property (nonatomic, copy) NSString *label;

@end



@interface SEEBlindScanBDModel : JSONModel

@property (nonatomic, strong) NSArray<SEEBlindScanBDResultModel>* result;

@end

@interface SEEBlindScanBDResultModel : JSONModel

@property (nonatomic, copy) NSString *keyword;

@end


@interface SEEBlindScanModel : JSONModel

@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong) SEEBlindScanDataModel *data;
@property (nonatomic, copy) NSString *desc;

@end



NS_ASSUME_NONNULL_END
