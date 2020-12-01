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
#define buttonSizeHeight 40
#define textfieldWidth 280
#define textfieldHeight 43

@implementation SEELoginView

- (void)initView {
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_loginButton];
    _loginButton.tintColor = [UIColor blackColor];
    _loginButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _loginButton.layer.cornerRadius = 7;
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(80);
        make.centerX.equalTo(self.mas_centerX).offset(-80);
        make.width.mas_equalTo(buttonSizeWidth);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_registerButton];
    _registerButton.tintColor = [UIColor blackColor];
    _registerButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _registerButton.layer.cornerRadius = 7;
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(80);
        make.centerX.equalTo(self.mas_centerX).offset(80);
        make.width.mas_equalTo(buttonSizeWidth);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    
    _userNameTextField = [[UITextField alloc] init];
    [self addSubview:_userNameTextField];
    _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.keyboardType = UIKeyboardTypeDefault;
    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(-80);
        make.width.mas_equalTo(textfieldWidth);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
    
    _userPassTextField = [[UITextField alloc] init];
    [self addSubview:_userPassTextField];
    _userPassTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userPassTextField.placeholder = @"请输入密码";
    _userPassTextField.keyboardType = UIKeyboardTypeDefault;
    _userPassTextField.secureTextEntry = YES;
    [_userPassTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_centerY).offset(-25);
        make.width.mas_equalTo(textfieldWidth);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
   
    
    
    
}


@end
