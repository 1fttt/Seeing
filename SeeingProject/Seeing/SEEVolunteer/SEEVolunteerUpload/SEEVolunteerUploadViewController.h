//
//  SEEVolunteerUploadViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/12/5.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEVolunteerUploadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEVolunteerUploadViewController : UIViewController

@property (nonatomic, strong) SEEVolunteerUploadView *uploadView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
