//
//  SEEBlindVideoCallView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallView.h"
#import "Masonry.h"

@implementation SEEBlindVideoCallView

- (void)initView {
//    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self addSubview:_scanButton];
    _scanButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"saoyisao"] style:UIBarButtonItemStyleDone target:self action:@selector(pressScan)];
 
    
    _videoCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_videoCallButton];
    
    _personView = [[UIView alloc] init];
    [self addSubview:_personView];
    
}

//点击扫一扫
- (void)pressScan {
    
}

//点击视频通话
- (void)pressCall {
    
}


@end
