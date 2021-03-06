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

//static AVSpeechSynthesizer *speech;

+ (instancetype)shareSpeech {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[SpeechManager alloc] init];
        }
    });
    return manager;
}

//+ (instancetype)shareManager {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (speech == nil) {
//            speech = [[AVSpeechSynthesizer alloc]init];
//
//        }
//    });
//    return manager;
//}

- (void)speech:(NSString *)str {
    
    AVSpeechSynthesizer *speech = [[AVSpeechSynthesizer alloc]init];
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:str];
    //设置语言
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.volume = 1.0f;  //音量 0 - 1
    //语速
    utterance.rate = 0.5f;
    //语调
    utterance.pitchMultiplier = 0.8f;
    
    [speech speakUtterance:utterance];
}




@end
