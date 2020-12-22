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
    
    
}


@end
