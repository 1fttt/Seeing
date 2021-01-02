//
//  SEEBlindPersonalContactTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/12/24.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalContactTableViewCell.h"
#import "Masonry.h"

@implementation SEEBlindPersonalContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    _phoneLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_phoneLabel];
    
    _callButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.contentView addSubview:_callButton];
    
    return self;
    
}


- (void)layoutSubviews {
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.textColor = [UIColor colorWithWhite:0 alpha:1];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(30);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-2);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(26);
    }];
    
    _phoneLabel.font = [UIFont systemFontOfSize:16];
    _phoneLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.top.equalTo(_nameLabel.mas_bottom).offset(4);
        make.width.mas_equalTo(155);
        make.height.mas_equalTo(22);
    }];
    
    
    [_callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-35);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(37);
    }]; 
    
    [_callButton setTitle:@"呼叫" forState:UIControlStateNormal];
    _callButton.backgroundColor = [UIColor colorWithRed:16/255.0 green:185/255.0 blue:57/255.0 alpha:1];
    _callButton.layer.cornerRadius = 8;
    _callButton.layer.masksToBounds = YES;
    _callButton.tintColor = [UIColor whiteColor];
    
}


@end
