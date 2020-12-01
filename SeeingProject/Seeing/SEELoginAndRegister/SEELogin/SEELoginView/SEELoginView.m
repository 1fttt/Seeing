//
//  SEELoginView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEELoginView.h"
#import "Masonry.h"
#define buttonSizeWidth 75
#define buttonSizeHeight 50
#define textfieldWidth 280
#define textfieldHeight 50
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation SEELoginView

- (void)initView {
    
    
    _seeingLabel = [[UILabel alloc] init];
    [self addSubview:_seeingLabel];
    _seeingLabel.text = @"Welcome To Seeing";
    _seeingLabel.font = [UIFont boldSystemFontOfSize:28];
    _seeingLabel.textColor = [UIColor blackColor];
    [_seeingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.mas_top).offset(170);
        make.width.equalTo(@300);
        make.height.mas_equalTo(100);
    }];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_loginButton];
    _loginButton.tintColor = [UIColor blackColor];
    _loginButton.backgroundColor = [UIColor colorWithRed:0/255 green:170.0/255 blue:240.0/255 alpha:1];
    _loginButton.layer.cornerRadius = 25;
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(160);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_registerButton];
    _registerButton.tintColor = [UIColor blackColor];
    _registerButton.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1];
    _registerButton.layer.cornerRadius = 25;
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    
    _userNameTextField = [[UITextField alloc] init];
    [self addSubview:_userNameTextField];
    _userNameTextField.borderStyle = UITextBorderStyleNone;
    _userNameTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _userNameTextField.layer.cornerRadius = 25;
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.keyboardType = UIKeyboardTypeDefault;
    
    //设置leftView 让text不紧贴左边边框
    _userNameTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
    //设置显示模式为永远显示(默认不显示)
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;

    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(-70);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
    
    _userPassTextField = [[UITextField alloc] init];
    [self addSubview:_userPassTextField];
    _userPassTextField.borderStyle = UITextBorderStyleNone;
    _userPassTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _userPassTextField.layer.cornerRadius = 25;
    _userPassTextField.placeholder = @"请输入密码";
    _userPassTextField.keyboardType = UIKeyboardTypeDefault;
    _userPassTextField.secureTextEntry = YES;
    
    //设置leftView 让text不紧贴左边边框
    _userPassTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
    //设置显示模式为永远显示(默认不显示)
    _userPassTextField.leftViewMode = UITextFieldViewModeAlways;

    [_userPassTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_userNameTextField.mas_bottom).offset(15);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
   
    _forgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:_forgetButton];
    _forgetButton.frame = CGRectMake(200, 690, 100, 30);
    [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    _forgetButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _forgetButton.tintColor = [UIColor colorWithWhite:0.2 alpha:1];
    
    
    
}


@end
