//
//  SpeechManager.m
//  Seeing
//
//  Created by 房彤 on 2020/12/23.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SpeechManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation SpeechManager

static SpeechManager *manager = nil;

+ (instancetype)shareSpeech {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[SpeechManager alloc] init];
        }
    });
    return manager;
}


- (void)speech:(NSString *)str {
    
    AVSpeechSynthesizer *speech = [[AVSpeechSynthesizer alloc]init];
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:str];
    //设置语言
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.volume = 1.0f;  //音量 0 - 1
    //语速
    utterance.rate = 2.0f;
    //语调
    utterance.pitchMultiplier = 3.0f;
    
    [speech speakUtterance:utterance];
}


@end
