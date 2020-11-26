//
//  SEEBlindVideoCallView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallView.h"

@implementation SEEBlindVideoCallView

- (void)initView {
    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_scanButton];
    
    _videoCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_videoCallButton];
    
    _personView = [[UIView alloc] init];
    [self addSubview:_personView];
    
}

@end
