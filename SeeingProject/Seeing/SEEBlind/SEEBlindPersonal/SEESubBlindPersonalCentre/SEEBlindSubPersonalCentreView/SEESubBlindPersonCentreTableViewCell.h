//
//  SEESubBlindPersonCentreTableViewCell.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEESubBlindPersonCentreTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *headButton;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *msgTextField;


//@property (nonatomic, strong) UIView *leftView;
//@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
