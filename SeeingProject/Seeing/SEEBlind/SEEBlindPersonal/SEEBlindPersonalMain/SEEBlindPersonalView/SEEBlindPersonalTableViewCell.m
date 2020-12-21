//
//  SEEBlindPersonalTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalTableViewCell.h"
#import "Masonry.h"
#define headButtonSize 110
#define nameLabelWidth 150
#define nameLabelHeight 40

@implementation SEEBlindPersonalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"cell"]) {

        _subTitlelabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitlelabel];
        _subTitlelabel.font = [UIFont systemFontOfSize:18];
        _subTitlelabel.textColor = [UIColor blackColor];
        
    } else if ([self.reuseIdentifier isEqualToString:@"0row"]) {
        
        _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_headButton];
        _headButton.layer.cornerRadius = headButtonSize / 2;
        _headButton.layer.masksToBounds = YES;
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
    } else if([self.reuseIdentifier isEqualToString:@"quit"]) {
        _quitlabel = [[UILabel alloc] init];
        [self.contentView addSubview:_quitlabel];
    }
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_subTitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    [_headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(headButtonSize);
        make.height.mas_equalTo(headButtonSize);
    }];
    
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.mas_equalTo(nameLabelWidth);
        make.height.mas_equalTo(nameLabelHeight);
    }];
    
    _nameLabel.font = [UIFont boldSystemFontOfSize:22];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _quitlabel.textAlignment = NSTextAlignmentCenter;
    _quitlabel.font = [UIFont systemFontOfSize:18];
    [_quitlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
    }];
    
}

@end
