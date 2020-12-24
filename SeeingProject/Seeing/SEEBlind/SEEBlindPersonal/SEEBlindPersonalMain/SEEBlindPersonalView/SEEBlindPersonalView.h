//
//  SEEBlindPersonalView.h
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindPersonalView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *quitButton;

@property (nonatomic, assign) int cellNumber;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, copy) NSArray *subTitleArray;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
