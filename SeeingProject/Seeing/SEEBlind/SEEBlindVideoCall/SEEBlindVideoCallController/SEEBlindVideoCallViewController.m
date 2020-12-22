//
//  SEEBlindVideoCallViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallViewController.h"

@interface SEEBlindVideoCallViewController ()

@end

@implementation SEEBlindVideoCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"视频通话";
    
    _callView = [[SEEBlindVideoCallView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_callView];
    
    [_callView initView];
    

}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}


@end
