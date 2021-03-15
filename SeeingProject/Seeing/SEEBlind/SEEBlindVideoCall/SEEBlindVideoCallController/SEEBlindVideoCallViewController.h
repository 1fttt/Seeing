//
//  SEEBlindVideoCallViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEBlindVideoCallView.h"

@class SEEBlindScanBDModel;

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindVideoCallViewController : UIViewController

@property (nonatomic, strong) SEEBlindVideoCallView *callView;
@property (nonatomic, copy) NSString *keyword;

@end

NS_ASSUME_NONNULL_END
