//
//  SEEBlindSubPersonalModifyView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/17.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindSubPersonalModifyView.h"
#import "Masonry.h"
#define backButtonsize 20
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@implementation SEEBlindSubPersonalModifyView

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
    
    _backLabel = [[UILabel alloc] init];
    [self addSubview:_backLabel];
    _backLabel.text = @"设置密码";
    _backLabel.font = [UIFont boldSystemFontOfSize:20];
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backButton.mas_right).offset(10);
        make.top.equalTo(_backButton.mas_top);
        make.height.mas_equalTo(_backButton.mas_height);
        make.width.mas_equalTo(130);
    }];
    
    _oldPasswordLabel = [[UILabel alloc] init];
    [self addSubview:_oldPasswordLabel];
    _oldPasswordLabel.text = @"旧密码";
    _oldPasswordLabel.font = [UIFont systemFontOfSize:19];
    _oldPasswordLabel.textColor = [UIColor blackColor];
    [_oldPasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(_backLabel.mas_bottom).offset(80);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
    _passwordLabel = [[UILabel alloc] init];
    [self addSubview:_passwordLabel];
    _passwordLabel.text = @"新密码";
    _passwordLabel.font = [UIFont systemFontOfSize:19];
    _passwordLabel.textColor = [UIColor blackColor];
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(_oldPasswordLabel.mas_bottom).offset(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
    _repeatLabel = [[UILabel alloc] init];
    [self addSubview:_repeatLabel];
    _repeatLabel.text = @"确认密码";
    _repeatLabel.font = [UIFont systemFontOfSize:19];
    _repeatLabel.textColor = [UIColor blackColor];
    [_repeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(_passwordLabel.mas_bottom).offset(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
    _oldPasswordTextfield = [[UITextField alloc] init];
    [self addSubview:_oldPasswordTextfield];
    _oldPasswordTextfield.borderStyle = UITextBorderStyleNone;
    _oldPasswordTextfield.placeholder = @"填写旧密码";
    _oldPasswordTextfield.secureTextEntry = YES;
    
    [_oldPasswordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_oldPasswordLabel.mas_right).offset(10);
        make.centerY.equalTo(_oldPasswordLabel.mas_centerY);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    }];
    
    _passwordTextfield = [[UITextField alloc] init];
    [self addSubview:_passwordTextfield];
    _passwordTextfield.borderStyle = UITextBorderStyleNone;
    _passwordTextfield.placeholder = @"填写新密码";
    _passwordTextfield.secureTextEntry = YES;
    
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passwordLabel.mas_right).offset(10);
        make.centerY.equalTo(_passwordLabel.mas_centerY);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    }];
    
    _repeatTextfield = [[UITextField alloc] init];
    [self addSubview:_repeatTextfield];
    _repeatTextfield.borderStyle = UITextBorderStyleNone;
    _repeatTextfield.placeholder = @"再次填写输入";
    _repeatTextfield.secureTextEntry = YES;
    
    [_repeatTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_repeatLabel.mas_right).offset(10);
        make.centerY.equalTo(_repeatLabel.mas_centerY);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    }];
    
    
    _oldPassImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:_oldPassImageView];
    [_oldPassImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_oldPasswordTextfield.mas_bottom).offset(2);
        make.left.equalTo(_oldPasswordTextfield.mas_left);
        make.width.equalTo(_oldPasswordTextfield.mas_width);
        make.height.mas_equalTo(0.6);
    }];
    
    _passImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:_passImageView];
    [_passImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextfield.mas_bottom).offset(2);
        make.left.equalTo(_passwordTextfield.mas_left);
        make.width.equalTo(_passwordTextfield.mas_width);
        make.height.mas_equalTo(0.6);
    }];
    
    _repeatImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:_repeatImageView];
    [_repeatImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_repeatTextfield.mas_bottom).offset(2);
        make.left.equalTo(_repeatTextfield.mas_left);
        make.width.equalTo(_repeatTextfield.mas_width);
        make.height.mas_equalTo(0.6);
    }];
    
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_sureButton];
    _sureButton.tintColor = [UIColor whiteColor];
    _sureButton.backgroundColor = [UIColor colorWithRed:0/255 green:210.0/255 blue:95.0/255 alpha:1];
    _sureButton.layer.cornerRadius = 25;
    _sureButton.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_repeatTextfield.mas_bottom).offset(95);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(50);
    }];
}

@end
