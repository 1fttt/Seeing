//
//  SEEBlindPersonalViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SEEBlindPersonalView;

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindPersonalViewController : UIViewController

@property SEEBlindPersonalView *personalView;

@property (nonatomic, strong) UIAlertController *alert;

@property (nonatomic, assign) BOOL isQuit;


@end

NS_ASSUME_NONNULL_END
