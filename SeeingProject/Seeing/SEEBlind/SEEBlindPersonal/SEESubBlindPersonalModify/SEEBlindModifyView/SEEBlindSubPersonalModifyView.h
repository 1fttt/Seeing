//
//  SEEBlindSubPersonalModifyView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/17.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindSubPersonalModifyView : UIView

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UILabel *backLabel;
@property (nonatomic, strong) UILabel *oldPasswordLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UILabel *repeatLabel;

@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UIImageView *oldPassImageView;
@property (nonatomic, strong) UIImageView *passImageView;
@property (nonatomic, strong) UIImageView *repeatImageView;

@property (nonatomic, strong) UITextField *oldPasswordTextfield;
@property (nonatomic, strong) UITextField *passwordTextfield;
@property (nonatomic, strong) UITextField *repeatTextfield;

- (void)initView;


@end

NS_ASSUME_NONNULL_END
