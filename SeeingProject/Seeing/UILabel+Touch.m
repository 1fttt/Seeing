//
//  UILabel+Touch.m
//  Seeing
//
//  Created by 房彤 on 2020/12/24.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "UILabel+Touch.h"
#import "SpeechManager.h"


@implementation UILabel (Touch)

- (void)touch {
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTouchUpside)];
    [self addGestureRecognizer:labelTapGestureRecognizer];
    self.userInteractionEnabled = YES;
}

- (void)labelTouchUpside {
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:self.text];
}


@end
