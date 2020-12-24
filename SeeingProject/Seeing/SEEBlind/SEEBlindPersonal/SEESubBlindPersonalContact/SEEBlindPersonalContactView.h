//
//  SEEBlindPersonalContactView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/23.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindPersonalContactView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *linkmanArray;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
