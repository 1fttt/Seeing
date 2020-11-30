//
//  SEESubBlindPersonCentreTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonCentreTableViewCell.h"
#import "Masonry.h"

@implementation SEESubBlindPersonCentreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    
    _textField = [[UITextField alloc] init];
    [self.contentView addSubview:_textField];
    
    
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
    
}

@end
