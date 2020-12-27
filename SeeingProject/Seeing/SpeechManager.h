//
//  SpeechManager.h
//  Seeing
//
//  Created by 房彤 on 2020/12/23.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpeechManager : NSObject

+ (instancetype)shareSpeech;

//+ (instancetype)shareManager;



- (void)speech:(NSString *)str;


@end

NS_ASSUME_NONNULL_END
