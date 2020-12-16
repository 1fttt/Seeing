//
//  SEEChooseView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEChooseView.h"
#import "Masonry.h"

#define buttonSize 140

@implementation SEEChooseView

- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    
    _chooseLabel = [[UILabel alloc] init];
    [self addSubview:_chooseLabel];
    _chooseLabel.font = [UIFont boldSystemFontOfSize:30];
    _chooseLabel.text = @"Choose Your Identity";
    [_chooseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.mas_top).offset(145);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@300);
        make.height.mas_equalTo(100);
    }];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_backButton];
    [_backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(60);
        make.left.equalTo(self.mas_left).offset(15);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    _blindButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_blindButton];
    _blindButton.layer.cornerRadius = buttonSize / 2;
    _blindButton.backgroundColor = [UIColor colorWithRed:0 green:200.0/255 blue:100.0/255 alpha:1];
    _blindButton.titleLabel.font = [UIFont systemFontOfSize:buttonSize * 0.40];
    [_blindButton setTitle:@"视" forState:UIControlStateNormal];
    _blindButton.tintColor = [UIColor colorWithWhite:1 alpha:1];
    [_blindButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_centerY).offset(-10);
        make.width.mas_equalTo(buttonSize);
        make.height.mas_equalTo(buttonSize);
    }];
    
    _volunteerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_volunteerButton];
    _volunteerButton.layer.cornerRadius = buttonSize / 2;
    _volunteerButton.backgroundColor = [UIColor colorWithRed:0/255 green:140.0/255 blue:240.0/255 alpha:1];
    _volunteerButton.titleLabel.font = [UIFont systemFontOfSize:buttonSize * 0.40];
    _volunteerButton.tintColor = [UIColor colorWithWhite:1 alpha:1];
    [_volunteerButton setTitle:@"志" forState:UIControlStateNormal];
    _volunteerButton.tintColor = [UIColor whiteColor];
    [_volunteerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(+50);
        make.width.mas_equalTo(buttonSize);
        make.height.mas_equalTo(buttonSize);
    }];
    

}

@end
