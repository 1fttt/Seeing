//
//  SEESubBlindPersonCentreTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonCentreTableViewCell.h"
#import "Masonry.h"
#define headButtonSize 95

@implementation SEESubBlindPersonCentreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"cell"]) {
        
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        
//        _lineView = [[UIView alloc] init];
//        [self.contentView addSubview:_lineView];
        
    } else if ([self.reuseIdentifier isEqualToString:@"0row"]) {
        
        _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_headButton];
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _msgLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_msgLabel];
        
        _nameTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_nameTextField];
        
        _msgTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_msgTextField];
        
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    //0row
    [_headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.width.mas_equalTo(headButtonSize);
        make.height.mas_equalTo(headButtonSize);
    }];
    _headButton.layer.cornerRadius = headButtonSize / 2;
    _headButton.layer.masksToBounds = YES;
    
    _nameLabel.font = [UIFont systemFontOfSize:18];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headButton.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_centerY).offset(-35);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    _nameTextField.borderStyle = UITextBorderStyleNone;
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_nameLabel.mas_centerY).offset(1.5);
        make.width.equalTo(@200);
        make.height.equalTo(_nameLabel.mas_height);
    }];
    
    _msgLabel.font = [UIFont systemFontOfSize:18];
    [_msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    _msgTextField.borderStyle = UITextBorderStyleNone;
    [_msgTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_msgLabel.mas_centerY).offset(1.5);
        make.width.equalTo(@200);
        make.height.equalTo(_nameLabel.mas_height);
    }];
    
    
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(32);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(10);
        make.centerY.equalTo(_label.mas_centerY).offset(1.5);;
        make.width.equalTo(@200);
        make.height.equalTo(_label.mas_height);
    }];
    
    _label.font = [UIFont systemFontOfSize:18];
    
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.keyboardType = UIKeyboardTypeDefault;
    
    
    
    
}

@end
