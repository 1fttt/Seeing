//
//  SEEBlindGeneralInfoTableViewCell.h
//  Seeing
//
//  Created by 房彤 on 2020/12/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindGeneralInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *titleImageView;

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weekLabel;


@property (nonatomic, strong) UIImageView *locationImageView;
@property (nonatomic, strong) UIImageView *weatherImageView;

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UILabel *tempMaxMinLabel;
@property (nonatomic, strong) UILabel *weaLabel;
 
@end

NS_ASSUME_NONNULL_END
