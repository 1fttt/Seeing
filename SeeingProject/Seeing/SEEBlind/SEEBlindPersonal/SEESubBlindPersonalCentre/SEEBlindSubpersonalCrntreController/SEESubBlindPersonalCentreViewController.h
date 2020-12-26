//
//  SEESubBlindPersonalCentreViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SEESubBlindPersonalCentreView;

NS_ASSUME_NONNULL_BEGIN

@interface SEESubBlindPersonalCentreViewController : UIViewController

@property (nonatomic, strong) SEESubBlindPersonalCentreView *centreView;

@property (nonatomic, strong) UIBarButtonItem *rightItem;

@property (nonatomic, assign) BOOL isEdit;


@end

NS_ASSUME_NONNULL_END
