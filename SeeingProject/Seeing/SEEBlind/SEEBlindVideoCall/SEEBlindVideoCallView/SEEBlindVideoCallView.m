//
//  SEEBlindVideoCallView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallView.h"
#import "Masonry.h"
#import "SpeechManager.h"
#import <AVFoundation/AVFoundation.h>


#define videoCallButtonWidth 130
#define videoCallButtonHeight 100
#define personViewWidth 300
#define personViewHeight 100
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation SEEBlindVideoCallView

- (void)initView {
    
    _personView = [[UIView alloc] init];
    [self addSubview:_personView];
    _personView.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
    _personView.layer.cornerRadius = 25;
    [_personView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.mas_equalTo(W);
        make.bottom.equalTo(self.mas_centerY).offset(55);
    }];
    
    [self initPersonView];
    
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.text = @"视频通话";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(50);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(30);
    }];
    
    
    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_scanButton];
    [_scanButton setImage:[UIImage imageNamed:@"saoyisao-3"] forState:UIControlStateNormal];
    [_scanButton addTarget:self action:@selector(pressCall) forControlEvents:UIControlEventTouchUpInside];
    
    [_scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-17);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(28);
    }];
    
    
    _videoCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_videoCallButton];
    [_videoCallButton setImage:[UIImage imageNamed:@"tonghua"] forState:UIControlStateNormal];
    _videoCallButton.layer.masksToBounds = YES;
    _videoCallButton.layer.cornerRadius = videoCallButtonWidth / 2;
    
    [_videoCallButton addTarget:self action:@selector(pressCall) forControlEvents:UIControlEventTouchUpInside];
    
    [_videoCallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(170);
        make.width.mas_equalTo(videoCallButtonWidth);
        make.height.mas_equalTo(videoCallButtonWidth);
    }];
    
    
    
}

- (void)initPersonView {
    
    //先要获取image
    //....
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tj.jpg"]];
    [_personView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_personView.mas_centerY).offset(-40);
        make.centerX.equalTo(_personView.mas_centerX);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(90);
    }];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 45;
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [_personView addSubview:nameLabel];
    
    
    

    
}



//点击扫一扫
- (void)pressScan {
    
}

//点击视频通话
- (void)pressCall {
//    SpeechManager *manager = [SpeechManager shareSpeech];
//    [manager speech:@"视频通话"];
    
    //语音播报

    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"床前明月光，疑是地上霜。举头望明月，低头思故乡。"];

    //设置播报语速

    utterance.rate =0.5;

    //中式发音

    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = voice;

    NSLog(@"%@",[AVSpeechSynthesisVoice speechVoices]);

    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc]init];

    [synth speakUtterance:utterance];

    
}


@end
