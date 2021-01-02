//
//  SEEVolunteerMainView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/7.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEVolunteerMainView : UIView

@property (nonatomic, strong) UIBarButtonItem *recordItem;

@property (nonatomic, strong) UIButton *recordButton;
@property (nonatomic, strong) UIView *personView;
@property (nonatomic, strong) UILabel *titleLabel;


- (void)initView;

@end

NS_ASSUME_NONNULL_END
