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
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [_personView addSubview:nameLabel];
    
    
    
}


- (void)pressRecord {
    
}

@end
