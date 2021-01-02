//
//  SEEBlindGeneralInfoTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/12/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindGeneralInfoTableViewCell.h"
#import "Masonry.h"


@implementation SEEBlindGeneralInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"titleCell"]) {
        
        _titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:_titleImageView];
        
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        
    } else if ([self.reuseIdentifier isEqualToString:@"timeCell"]) {
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
        
        _dateLabel = [[UILabel alloc] init];
        [self.contentView  addSubview:_dateLabel];
        
        _weekLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_weekLabel];
        
    } else if ([self.reuseIdentifier isEqualToString:@"weatherCell"]) {
        
        _cityLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_cityLabel];
        
        _tempLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_tempLabel];
        
        _tempMaxMinLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_tempMaxMinLabel];
        
        _weaLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_weaLabel];
        
        _locationImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_locationImageView];
        
        _weatherImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_weatherImageView];
        
        
    } else if ([self.reuseIdentifier isEqualToString:@"musicCell"]) {
        _scrollView = [[UIScrollView alloc] init];
        [self.contentView addSubview:_scrollView];
        

    } else if ([self.reuseIdentifier isEqualToString:@"storyCell"]) {
        _storyTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_storyTitleLabel];
        
        _hintLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_hintLabel];
        
        _imageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageview];
    }
    
    
    return self;
}


- (void)layoutSubviews {
    
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(23);
        make.width.mas_offset(35);
        make.height.mas_equalTo(35);
    }];
    
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(_titleImageView.mas_right).offset(10);
        make.width.mas_offset(95);
        make.height.mas_equalTo(35);
    }];
    
    
    //时间
    _timeLabel.font = [UIFont boldSystemFontOfSize:45];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-18);
        make.left.equalTo(self.contentView.mas_left).offset(43);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(55);
    }];
    
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    
    
    _dateLabel.font = [UIFont systemFontOfSize:20];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(5);
        make.left.equalTo(_timeLabel);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(40);
    }];
    
    _weekLabel.font = [UIFont systemFontOfSize:40];
    [_weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-25);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(70);
    }];
    
    
    //天气
    _tempLabel.textAlignment = NSTextAlignmentCenter;
    _tempLabel.font = [UIFont boldSystemFontOfSize:45];
    [_tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-18);
        make.left.equalTo(self.contentView.mas_left).offset(43);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(55);
    }];
    
    [_locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tempLabel.mas_bottom).offset(13);
        make.left.equalTo(_tempLabel.mas_left);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(18);
    }];
    
    _cityLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    _cityLabel.font = [UIFont systemFontOfSize:16];
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tempLabel.mas_bottom).offset(7);
        make.left.equalTo(_locationImageView.mas_right).offset(2);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    
    _tempMaxMinLabel.textAlignment = NSTextAlignmentCenter;
    _tempMaxMinLabel.font = [UIFont systemFontOfSize:20];
    [_tempMaxMinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tempLabel.mas_bottom).offset(6.5);
        make.right.equalTo(_tempLabel.mas_right);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    
    [_weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-20);
        make.right.equalTo(self.contentView.mas_right).offset(-52);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(75);
    }];
    
    _weaLabel.font = [UIFont systemFontOfSize:24];
    _weaLabel.textAlignment = NSTextAlignmentCenter;
    [_weaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_weatherImageView.mas_centerY).offset(50);
        //make.right.equalTo(_weatherImageView.mas_left).offset(-3);
        make.centerX.equalTo(_weatherImageView.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    

    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.size.equalTo(self.contentView);
    }];
    
    
    _storyTitleLabel.frame = CGRectMake(20, 20, 280, 50);
    _hintLabel.frame = CGRectMake(20, 80, 200, 20);
    _imageview.frame = CGRectMake(318, 19, 80, 80);
    
    //_titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];

    //_titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _storyTitleLabel.numberOfLines = 2;
    _hintLabel.font = [UIFont systemFontOfSize:14];
    _hintLabel.textColor = [UIColor colorWithWhite:0.56 alpha:1];
    
}


@end
