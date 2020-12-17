//
//  SEEResetPasswordViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/12/17.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SEEResetPasswordView;

NS_ASSUME_NONNULL_BEGIN

@interface SEEResetPasswordViewController : UIViewController

@property (nonatomic, strong) SEEResetPasswordView *resetView;
@property (nonatomic, copy) NSString *phoneStr;
@end

NS_ASSUME_NONNULL_END
