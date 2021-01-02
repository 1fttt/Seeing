//
//  SEEVolunteerUploadViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/5.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerUploadViewController.h"
#import "Masonry.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@interface SEEVolunteerUploadViewController ()<BMKMapViewDelegate>
@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation SEEVolunteerUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
    _uploadView = [[SEEVolunteerUploadView alloc]  initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 90)];
    [self.view addSubview:_uploadView];
    _uploadView.layer.cornerRadius = 25;
    [_uploadView initView];
    
    [self addView];
    
    _mapView = [[BMKMapView alloc]initWithFrame:_uploadView.bounds];
    //_mapView.layer.cornerRadius = 25;
    _mapView.delegate = self;
    [self.uploadView addSubview:_mapView];
    
    [_mapView setZoomLevel:17];
    //显示比例尺
    _mapView.showMapScaleBar = YES;
    //隐藏比例尺
    //_mapView.showMapScaleBar = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    

    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    [_mapView viewWillAppear];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
}



- (void)addView {
    _titleLabel = [[UILabel alloc] init];
    [self.view addSubview:_titleLabel];
    _titleLabel.text = @"盲道上传";
    //_titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(30);
    }];
}


@end
