//
//  SEEForgetView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEForgetView : UIView

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *hintLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *verifyLabel;

@property (nonatomic, strong) UITextField *textfield;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, copy) NSString *numberStr;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
