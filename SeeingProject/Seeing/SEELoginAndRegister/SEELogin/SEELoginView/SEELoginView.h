//
//  SEELoginView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEELoginView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *seeingLabel;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *userPassTextField;
@property (nonatomic, strong) UIButton *forgetButton;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
