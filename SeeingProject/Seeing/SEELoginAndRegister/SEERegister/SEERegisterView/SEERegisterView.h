//
//  SEERegisterView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
    
@interface SEERegisterView : UIView

@property (nonatomic, strong) UILabel *registerLabel;

@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *userPassTextField;
@property (nonatomic, strong) UITextField *userNumberTextField;


- (void)initView;

@end

NS_ASSUME_NONNULL_END
