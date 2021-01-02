//
//  SEEBlindGeneralInfoView.h
//  Seeing
//
//  Created by 房彤 on 2020/12/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEBlindWeatherModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindGeneralInfoView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIScrollView *scr;

@property (nonatomic, strong) NSMutableArray *timeCellArray;
@property (nonatomic, strong) NSMutableArray *weatherArray;
@property (nonatomic, copy) NSString *weatherStr;

@property (nonatomic, assign) int currentStory;

@property (nonatomic, strong) SEEBlindWeatherModel *weatherModel;
@property (nonatomic, strong) SEEBlindStoryModel *storyModel;

- (void)initView;

@end

NS_ASSUME_NONNULL_END
