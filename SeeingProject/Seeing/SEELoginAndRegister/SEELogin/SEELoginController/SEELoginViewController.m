//
//  SEELoginViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEELoginViewController.h"
#import "SEEChooseViewController.h"
#import "SEEBlindVideoCallViewController.h"
#import "SEEBlindGeneralInfoViewController.h"
#import "SEEBlindPersonalViewController.h"

@interface SEELoginViewController ()

@end

@implementation SEELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _loginView = [[SEELoginView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_loginView];
    [_loginView initView];
    
    [_loginView.registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
}
    
- (void)pressLogin {
    
    [self loginSuccess];
}

- (void)pressRegister {
    SEEChooseViewController *chooseView = [[SEEChooseViewController alloc] init];
    chooseView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:chooseView animated:YES completion:nil];
}

- (void)loginSuccess {
    
    SEEBlindVideoCallViewController *videoCallView = [[SEEBlindVideoCallViewController alloc] init];
    
    UINavigationController *videoCallNav = [[UINavigationController alloc] initWithRootViewController:videoCallView];
    
    SEEBlindGeneralInfoViewController *generalInfoView = [[SEEBlindGeneralInfoViewController alloc] init];
    UINavigationController *generalInfoNav = [[UINavigationController alloc] initWithRootViewController:generalInfoView];
    
    SEEBlindPersonalViewController *personalView = [[SEEBlindPersonalViewController alloc] init];
    UINavigationController *personalNav = [[UINavigationController alloc] initWithRootViewController:personalView];
    
    NSArray *array = [NSArray arrayWithObjects:videoCallNav, generalInfoNav, personalNav, nil];
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = array;
    
    //设置选中状态的颜色
    tabbarController.tabBar.tintColor = [UIColor redColor];
    
    tabbarController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tabbarController animated:YES completion:nil];
    
}


@end
