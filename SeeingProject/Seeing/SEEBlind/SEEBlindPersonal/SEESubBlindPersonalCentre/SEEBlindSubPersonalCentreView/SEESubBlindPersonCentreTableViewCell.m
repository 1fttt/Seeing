//
//  SEESubBlindPersonCentreTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonCentreTableViewCell.h"
#import "Masonry.h"
#define headButtonSize 70

@implementation SEESubBlindPersonCentreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"cell"]) {
        
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        
        _lineView = [[UIView alloc] init];
        [self.contentView addSubview:_lineView];
        
    } else if ([self.reuseIdentifier isEqualToString:@"0row"]) {
        
        _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_headButton];
        
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(self.contentView.mas_height);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(30);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@200);
        make.height.equalTo(self.contentView.mas_height);
    }];
    
    _label.font = [UIFont systemFontOfSize:18];
    
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.keyboardType = UIKeyboardTypeDefault;
    
    
    //0row
    [_headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.width.mas_equalTo(headButtonSize);
        make.height.mas_equalTo(headButtonSize);
    }];
    _headButton.layer.cornerRadius = headButtonSize / 2;
    _headButton.layer.masksToBounds = YES;
    
}

@end
