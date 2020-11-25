//
//  SEEChooseView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEChooseView.h"
#import "Masonry.h"

#define buttonSize 110

@implementation SEEChooseView

- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    _blindButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_blindButton];
    _blindButton.layer.cornerRadius = buttonSize / 2;
    _blindButton.backgroundColor = [UIColor colorWithWhite:0.89 alpha:1];
    _blindButton.titleLabel.font = [UIFont systemFontOfSize:buttonSize * 0.40];
    _blindButton.tintColor = [UIColor colorWithWhite:0.2 alpha:1];
    [_blindButton setTitle:@"视" forState:UIControlStateNormal];
    [_blindButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_centerY).offset(-30);
        make.width.mas_equalTo(buttonSize);
        make.height.mas_equalTo(buttonSize);
    }];
    
    _volunteerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_volunteerButton];
    _volunteerButton.layer.cornerRadius = buttonSize / 2;
    _volunteerButton.backgroundColor = [UIColor colorWithWhite:0.89 alpha:1];
    _volunteerButton.titleLabel.font = [UIFont systemFontOfSize:buttonSize * 0.40];
    _volunteerButton.tintColor = [UIColor colorWithWhite:0.2 alpha:1];
    [_volunteerButton setTitle:@"志" forState:UIControlStateNormal];
    [_volunteerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(+30);
        make.width.mas_equalTo(buttonSize);
        make.height.mas_equalTo(buttonSize);
    }];
    

}

@end
