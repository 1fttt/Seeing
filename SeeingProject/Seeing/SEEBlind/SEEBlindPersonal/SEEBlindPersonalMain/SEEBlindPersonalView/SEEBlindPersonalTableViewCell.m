//
//  SEEBlindPersonalTableViewCell.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalTableViewCell.h"
#import "Masonry.h"

@implementation SEEBlindPersonalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [self.contentView addSubview:_label];
    _label.font = [UIFont systemFontOfSize:18];
    _label.textColor = [UIColor blackColor];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
}

@end
