//
//  SEEBlindVideoCallView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallView.h"
#import "Masonry.h"
#define videoCallButtonWidth 300
#define videoCallButtonHeight 100
#define personViewWidth 300
#define personViewHeight 100

@implementation SEEBlindVideoCallView

- (void)initView {
//    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self addSubview:_scanButton];
    _scanButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"saoyisao"] style:UIBarButtonItemStyleDone target:self action:@selector(pressScan)];
 
    
    _personView = [[UIView alloc] init];
    [self addSubview:_personView];
    [_personView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-200);
        make.width.mas_equalTo(personViewWidth);
        make.height.mas_equalTo(personViewHeight);
    }];
    
    
    _videoCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_videoCallButton];
    [_videoCallButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_videoCallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(20);
        make.width.mas_equalTo(videoCallButtonWidth);
        make.height.mas_equalTo(videoCallButtonHeight);
    }];
    
    
    
    
    
    
}



//点击扫一扫
- (void)pressScan {
    
}

//点击视频通话
- (void)pressCall {
    
}


@end
