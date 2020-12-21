//
//  SEEVolunteerPersonalViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/12/5.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEVolunteerPersonalView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEVolunteerPersonalViewController : UIViewController

@property (nonatomic, strong) SEEVolunteerPersonalView *personalView;

@property (nonatomic, strong) UIAlertController *alert;

@property (nonatomic, assign) BOOL isQuit;

@end

NS_ASSUME_NONNULL_END
