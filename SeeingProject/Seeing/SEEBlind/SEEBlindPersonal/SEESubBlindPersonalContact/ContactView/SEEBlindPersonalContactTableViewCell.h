//
//  SEEBlindPersonalContactTableViewCell.h
//  Seeing
//
//  Created by 房彤 on 2020/12/24.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindPersonalContactTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIButton *callButton;

@end
 
NS_ASSUME_NONNULL_END
