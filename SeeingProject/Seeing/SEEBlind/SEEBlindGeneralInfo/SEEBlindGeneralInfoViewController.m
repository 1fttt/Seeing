//
//  SEEBlindGeneralInfoViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindGeneralInfoViewController.h"
#import "SEEBlindStoryViewController.h"
#import "Masonry.h"
#import "SpeechManager.h"

@interface SEEBlindGeneralInfoViewController ()

@end

@implementation SEEBlindGeneralInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
    [self addView];
    
    _infoView = [[SEEBlindGeneralInfoView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 90)];
    _infoView.layer.cornerRadius = 25;
    [self.view addSubview:_infoView];
    [_infoView initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressStoryCell) name:@"storyCellPush" object:nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
    self.tabBarController.tabBar.hidden = NO;
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"常用信息页面"];
}

- (void)addView {
    _titleLabel = [[UILabel alloc] init];
    [self.view addSubview:_titleLabel];
    _titleLabel.text = @"常用信息";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(30);
    }];
}

- (void)pressStoryCell {
    SEEBlindStoryViewController *storyView = [[SEEBlindStoryViewController alloc] init];
    
    Stories *story = _infoView.storyModel.stories[_infoView.currentStory];
    storyView.urlStr = [NSString stringWithString:story.url];
    [self.navigationController pushViewController:storyView animated:YES];
}

@end
