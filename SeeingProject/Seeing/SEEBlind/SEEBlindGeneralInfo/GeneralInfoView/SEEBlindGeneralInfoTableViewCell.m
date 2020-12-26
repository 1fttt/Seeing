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
        
    } else if ([self.reuseIdentifier isEqualToString:@"section0"]) {
        
    } else if ([self.reuseIdentifier isEqualToString:@"section1"]) {
        
    } else if ([self.reuseIdentifier isEqualToString:@"section2"]) {
        
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
    
    
    _dateLabel.font = [UIFont systemFontOfSize:24];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(5);
        make.left.equalTo(_timeLabel);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(40);
    }];
    
    _weekLabel.font = [UIFont boldSystemFontOfSize:45];
    [_weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-25);
        make.width.mas_equalTo(120);
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
        make.top.equalTo(_tempLabel.mas_bottom).offset(5);
        make.left.equalTo(_tempLabel.mas_left);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tempLabel.mas_bottom).offset(5);
        make.left.equalTo(_locationImageView.mas_right).offset(5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    
    _tempMaxMinLabel.textAlignment = NSTextAlignmentRight;
    [_tempMaxMinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tempLabel.mas_bottom).offset(5);
        make.right.equalTo(_tempLabel.mas_right);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    
    [_weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-25);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    _weaLabel.font = [UIFont boldSystemFontOfSize:45];
    [_weaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(_weatherImageView.mas_left).offset(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    

}


@end
