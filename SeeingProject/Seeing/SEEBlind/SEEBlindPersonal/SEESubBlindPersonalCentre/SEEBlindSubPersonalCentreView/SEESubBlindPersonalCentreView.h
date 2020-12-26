//
//  SEESubBlindPersonalCentreView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface SEESubBlindPersonalCentreView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) NSMutableArray *textFieldArray;


- (void)initView;

@end

NS_ASSUME_NONNULL_END
