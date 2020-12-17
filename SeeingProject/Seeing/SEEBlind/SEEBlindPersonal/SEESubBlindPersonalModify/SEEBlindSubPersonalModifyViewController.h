//
//  SEEBlindSubPersonalModifyViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEBlindSubPersonalModifyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindSubPersonalModifyViewController : UIViewController

@property (nonatomic, strong) SEEBlindSubPersonalModifyView *modifyView;

@property (nonatomic, copy) NSString *phoneStr;
@end

NS_ASSUME_NONNULL_END
