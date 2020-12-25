//
//  SEEBlindContactAddView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindContactAddView : UIView

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *relationLabel;
@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UITextField *nameTextfield;
@property (nonatomic, strong) UITextField *relationTextfield;
@property (nonatomic, strong) UITextField *phoneTextfield;

@property (nonatomic, strong) UIButton *sureButton;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
