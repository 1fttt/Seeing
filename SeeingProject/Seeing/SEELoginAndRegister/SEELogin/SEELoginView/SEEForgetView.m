//
//  SEEForgetView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEForgetView.h"
#import "Masonry.h"

#define backButtonsize 20
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation SEEForgetView

- (void)initView {
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_backButton];
    [_backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(60);
        make.width.mas_equalTo(backButtonsize);
        make.height.mas_equalTo(backButtonsize);
    }];
    
    _label = [[UILabel alloc] init];
    [self addSubview:_label];
    _label.text = @"填写验证码";
    _label.font = [UIFont boldSystemFontOfSize:20];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backButton.mas_right).offset(10);
        make.top.equalTo(_backButton.mas_top);
        make.height.mas_equalTo(_backButton.mas_height);
        make.width.mas_equalTo(130);
    }];
    
    _hintLabel = [[UILabel alloc] init];
    [self addSubview:_hintLabel];
    _hintLabel.text = @"我们已发送了验证码到你的手机";
    _hintLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    _hintLabel.font = [UIFont systemFontOfSize:17];
    _hintLabel.textAlignment = NSTextAlignmentCenter;
    [_hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_label.mas_bottom).offset(60);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(250);
    }];
    
    _numberLabel = [[UILabel alloc] init];
    [self addSubview:_numberLabel];
    _numberLabel.text = _numberStr;
    _numberLabel.font = [UIFont boldSystemFontOfSize:29];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_hintLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(45);
    }];
    
    _verifyLabel = [[UILabel alloc] init];
    [self addSubview:_verifyLabel];
    _verifyLabel.text = @"验证码";
    _verifyLabel.font = [UIFont systemFontOfSize:18];
    _verifyLabel.textColor = [UIColor blackColor];
    [_verifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(25);
        make.top.equalTo(_numberLabel.mas_bottom).offset(30);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(35);
    }];
    
    _textfield = [[UITextField alloc] init];
    [self addSubview:_textfield];
    _textfield.borderStyle = UITextBorderStyleNone;
    _textfield.placeholder = @"请输入验证码";
    
    [_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_numberLabel.mas_left);
        make.centerY.equalTo(_verifyLabel.mas_centerY);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(35);
    }];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian"]];
    [self addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textfield.mas_bottom).offset(2);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(1);
    }];
    
    _nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_nextButton];
    _nextButton.tintColor = [UIColor whiteColor];
    _nextButton.backgroundColor = [UIColor colorWithRed:0/255 green:210.0/255 blue:95.0/255 alpha:1];
    _nextButton.layer.cornerRadius = 25;
    _nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_textfield.mas_bottom).offset(95);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(50);
    }];
}

@end
