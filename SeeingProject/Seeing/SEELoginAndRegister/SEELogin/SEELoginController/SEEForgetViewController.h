//
//  SEEForgetViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEForgetView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEForgetViewController : UIViewController

@property (nonatomic, strong) SEEForgetView *forgetView;

@property (nonatomic, copy) NSString *veriftStr;

@property (nonatomic, copy) NSString *numberStr;
@end

NS_ASSUME_NONNULL_END
