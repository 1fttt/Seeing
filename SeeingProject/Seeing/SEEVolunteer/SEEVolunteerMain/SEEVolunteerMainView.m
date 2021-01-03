//
//  SEEVolunteerMainView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/7.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerMainView.h"
#import "Masonry.h"
#define personViewWidth 300
#define personViewHeight 100
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation SEEVolunteerMainView

- (void)initView {

    
    _personView = [[UIView alloc] init];
    [self addSubview:_personView];
    _personView.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
    _personView.layer.cornerRadius = 25;
    [_personView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.mas_equalTo(W);
        make.bottom.equalTo(self.mas_centerY).offset(55);
    }];
    
    [self initPersonView];
    
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.text = @"视频通话";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(50);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(30);
    }];
    
    
    _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_recordButton];
    [_recordButton setImage:[UIImage imageNamed:@"tonghuajilu-3"] forState:UIControlStateNormal];
    [_recordButton addTarget:self action:@selector(pressRecord) forControlEvents:UIControlEventTouchUpInside];
    
    [_recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-17);
        make.width.mas_equalTo(37);
        make.height.mas_equalTo(37);
    }];
    
   
}

- (void)initPersonView {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    //先要获取image
    //....
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tj.jpg"]];
    [_personView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_personView).offset(150);
        make.centerX.equalTo(_personView.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(110);
    }];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 55;
    
    
    _nameLabel = [[UILabel alloc] init];
    [_personView addSubview:_nameLabel];
    _nameLabel.font = [UIFont systemFontOfSize:23];
    _nameLabel.textColor = [UIColor colorWithWhite:1 alpha:1];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = [NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"name"]];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(20);
        make.centerX.equalTo(_personView.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(30);
    }];
    
    _idLabel = [[UILabel alloc] init];
    [_personView addSubview:_idLabel];
    _idLabel.font = [UIFont systemFontOfSize:20];
    _idLabel.textColor = [UIColor colorWithWhite:1 alpha:1];
    _idLabel.textAlignment = NSTextAlignmentCenter;
    _idLabel.text = [NSString stringWithFormat:@"志愿 id: %@", [userDefaults objectForKey:@"id"]];
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(60);
        make.centerX.equalTo(_personView.mas_centerX).offset(-93);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(30);
    }];
    
    _helpedLabel = [[UILabel alloc] init];
    [_personView addSubview:_helpedLabel];
    _helpedLabel.font = [UIFont systemFontOfSize:20];
    _helpedLabel.textColor = [UIColor colorWithWhite:1 alpha:1];
    _helpedLabel.textAlignment = NSTextAlignmentCenter;
    _helpedLabel.text = [NSString stringWithFormat:@"已帮助: 0次"];
    //_helpedLabel.text = [NSString stringWithFormat:@"被帮助:%@", [userDefaults objectForKey:@"id"]];
    [_helpedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_idLabel.mas_top);
        make.centerX.equalTo(_personView.mas_centerX).offset(95);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(30);
    }];
    
    
    _label = [[UILabel alloc] init];
    [self addSubview:_label];
    _label.text = @"请耐心等待接听视频电话，让我们一起来帮盲！";
    _label.lineBreakMode = NSLineBreakByWordWrapping;

    _label.numberOfLines = 2;
    _label.font = [UIFont systemFontOfSize:19];
    _label.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    _label.textAlignment = NSTextAlignmentCenter;
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(283);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(270);
        make.height.mas_equalTo(60);
    }];
    
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithString:_label.text]];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    _label.attributedText = content;
}


- (void)pressRecord {
    
}

@end
