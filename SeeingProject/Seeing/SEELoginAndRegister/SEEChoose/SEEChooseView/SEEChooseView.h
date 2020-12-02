//
//  SEEChooseView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEChooseView : UIView

@property (nonatomic, strong) UILabel *chooseLabel;
@property (nonatomic, strong) UIButton *backButton;
@property UIButton *blindButton;
@property UIButton *volunteerButton;

- (void)viewInit;

@end

NS_ASSUME_NONNULL_END
