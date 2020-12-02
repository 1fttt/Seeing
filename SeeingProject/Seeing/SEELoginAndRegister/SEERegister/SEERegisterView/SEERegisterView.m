//
//  SEERegisterView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEERegisterView.h"
#import "Masonry.h"
#define buttonSizeWidth 75
#define buttonSizeHeight 50
#define textfieldWidth 280
#define textfieldHeight 50
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@implementation SEERegisterView

- (void)initView {
    
    _registerLabel = [[UILabel alloc] init];
    [self addSubview:_registerLabel];
    _registerLabel.text = @"Create An Account";
    _registerLabel.font = [UIFont boldSystemFontOfSize:30];
    _registerLabel.textColor = [UIColor blackColor];
    [_registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.mas_top).offset(145);
        make.width.equalTo(@300);
        make.height.mas_equalTo(100);
    }];
    
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_sureButton];
    _sureButton.tintColor = [UIColor blackColor];
    _sureButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _sureButton.layer.cornerRadius = 25;
    _sureButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    _sureButton.backgroundColor = [UIColor colorWithRed:0/255 green:170.0/255 blue:240.0/255 alpha:1];
    
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(160);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_cancelButton];
    _cancelButton.tintColor = [UIColor blackColor];
    _cancelButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _cancelButton.layer.cornerRadius = 25;
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:19];
    _cancelButton.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sureButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    
    _userNameTextField = [[UITextField alloc] init];
    [self addSubview:_userNameTextField];
    _userNameTextField.borderStyle = UITextBorderStyleNone;
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.keyboardType = UIKeyboardTypeDefault;
    
    _userNameTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _userNameTextField.layer.cornerRadius = 25;
    //设置leftView 让text不紧贴左边边框
    _userNameTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
    //设置显示模式为永远显示(默认不显示)
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-110);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
    
    _userNumberTextField = [[UITextField alloc] init];
    [self addSubview:_userNumberTextField];
    _userNumberTextField.borderStyle = UITextBorderStyleNone;
    _userNumberTextField.placeholder = @"请输入手机号";
    _userNumberTextField.keyboardType = UIKeyboardTypeDefault;
    
    _userNumberTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _userNumberTextField.layer.cornerRadius = 25;
    //设置leftView 让text不紧贴左边边框
    _userNumberTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
    //设置显示模式为永远显示(默认不显示)
    _userNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_userNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(15);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
    
    _userPassTextField = [[UITextField alloc] init];
    [self addSubview:_userPassTextField];
    _userPassTextField.borderStyle = UITextBorderStyleNone;
    _userPassTextField.placeholder = @"请输入密码";
    _userPassTextField.keyboardType = UIKeyboardTypeDefault;
    _userPassTextField.secureTextEntry = YES;
    
    _userPassTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _userPassTextField.layer.cornerRadius = 25;
    //设置leftView 让text不紧贴左边边框
    _userPassTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)];
    //设置显示模式为永远显示(默认不显示)
    _userPassTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_userPassTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.userNumberTextField.mas_bottom).offset(15);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
}

@end
