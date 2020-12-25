//
//  SEEBlindContactAddView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindContactAddView.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@implementation SEEBlindContactAddView

- (void)initView {
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.font = [UIFont systemFontOfSize:19];
    _nameLabel.text = @"姓名：";
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.mas_top).offset(145);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
    }];
    
    
    _relationLabel = [[UILabel alloc] init];
    [self addSubview:_relationLabel];
    _relationLabel.font = [UIFont systemFontOfSize:19];
    _relationLabel.text = @"关系：";
    
    [_relationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(30);
        make.width.equalTo(_nameLabel);
        make.height.equalTo(_nameLabel);
    }];
    
    _phoneLabel = [[UILabel alloc] init];
    [self addSubview:_phoneLabel];
    _phoneLabel.font = [UIFont systemFontOfSize:19];
    _phoneLabel.text = @"手机号：";
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_relationLabel.mas_bottom).offset(30);
        make.width.equalTo(_nameLabel);
        make.height.equalTo(_nameLabel);
    }];
    
    _nameTextfield = [[UITextField alloc] init];
    [self addSubview:_nameTextfield];
    _nameTextfield.borderStyle = UITextBorderStyleNone;
    _nameTextfield.placeholder = @"填写联系人姓名";
    
    [_nameTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_nameLabel.mas_centerY);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    
    }];
    
    _relationTextfield = [[UITextField alloc] init];
    [self addSubview:_relationTextfield];
    _relationTextfield.borderStyle = UITextBorderStyleNone;
    _relationTextfield.placeholder = @"填写与联系人的关系";
    
    [_relationTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_relationLabel);
        make.width.equalTo(_nameTextfield);
        make.height.equalTo(_nameTextfield);
    }];
    
    _phoneTextfield = [[UITextField alloc] init];
    [self addSubview:_phoneTextfield];
    _phoneTextfield.borderStyle = UITextBorderStyleNone;
    _phoneTextfield.placeholder = @"填写联系人手机号";
    
    [_phoneTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLabel.mas_right).offset(10);
        make.centerY.equalTo(_phoneLabel);
        make.width.equalTo(_nameTextfield);
        make.height.equalTo(_nameTextfield);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextfield.mas_bottom).offset(2);
        make.left.equalTo(_nameTextfield.mas_left);
        make.width.equalTo(_nameTextfield.mas_width);
        make.height.mas_equalTo(0.6);
    }];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_relationTextfield.mas_bottom).offset(2);
        make.left.equalTo(_relationTextfield.mas_left);
        make.width.equalTo(_relationTextfield.mas_width);
        make.height.mas_equalTo(0.6);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengexian-2"]];
    [self addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextfield.mas_bottom).offset(2);
        make.left.equalTo(_phoneTextfield.mas_left);
        make.width.equalTo(_phoneTextfield.mas_width);
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
        make.centerY.equalTo(_phoneTextfield.mas_bottom).offset(95);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(50);
    }];
    
}

@end
