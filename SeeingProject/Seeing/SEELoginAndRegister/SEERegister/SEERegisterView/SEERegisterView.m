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
#define buttonSizeHeight 40
#define textfieldWidth 280
#define textfieldHeight 43


@implementation SEERegisterView

- (void)initView {
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_sureButton];
    _sureButton.tintColor = [UIColor blackColor];
    _sureButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _sureButton.layer.cornerRadius = 7;
    _sureButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(80);
        make.centerX.equalTo(self.mas_centerX).offset(-80);
        make.width.mas_equalTo(buttonSizeWidth);
        make.height.mas_equalTo(buttonSizeHeight);
    }];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_cancelButton];
    _cancelButton.tintColor = [UIColor blackColor];
    _cancelButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _cancelButton.layer.cornerRadius = 7;
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.top.equalTo(self.mas_top).offset(305);
        make.width.mas_equalTo(textfieldWidth);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
    
    _userPassTextField = [[UITextField alloc] init];
    [self addSubview:_userPassTextField];
    _userPassTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userPassTextField.placeholder = @"请输入密码";
    _userPassTextField.keyboardType = UIKeyboardTypeDefault;
    
    [_userPassTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(370);
        make.width.mas_equalTo(textfieldWidth);
        make.height.mas_equalTo(textfieldHeight);
        
    }];
}

@end
