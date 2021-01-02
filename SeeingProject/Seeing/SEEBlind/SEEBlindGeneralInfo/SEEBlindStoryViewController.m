//
//  SEEBlindStoryViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindStoryViewController.h"

@interface SEEBlindStoryViewController ()

@end

@implementation SEEBlindStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80)];
    [self.view addSubview:_wkWebView];
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[ NSURL URLWithString:_urlStr]]];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}


@end
