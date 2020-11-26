//
//  SEEBlindVideoCallView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindVideoCallView : UIView

@property (nonatomic, strong) UIButton *scanButton;
@property (nonatomic, strong) UIButton *videoCallButton;
@property (nonatomic, strong) UIView *personView;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
