//
//  SEELoginViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEELoginView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEELoginViewController : UIViewController 

@property (nonatomic, strong) SEELoginView *loginView;
@property (nonatomic, assign) BOOL avoidLogin;
@property (nonatomic, assign) BOOL isRegister;
@property (nonatomic, assign) BOOL isReset;
@property (nonatomic, assign) BOOL isQuit;
@end

NS_ASSUME_NONNULL_END
