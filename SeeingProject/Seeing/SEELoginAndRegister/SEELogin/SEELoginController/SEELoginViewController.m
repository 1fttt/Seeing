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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerSuccess:) name:@"nameAndPass" object:nil];
    
}
    
- (void)pressLogin {
    
    //登录成功
    [self loginSuccess];
}

- (void)pressRegister {
    SEEChooseViewController *chooseView = [[SEEChooseViewController alloc] init];
    chooseView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:chooseView animated:YES completion:nil];
}



//登录成功
- (void)loginSuccess {
    
    //存储账号密码
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_loginView.userNameTextField.text forKey:@"userAccount"];
    [userDefaults setObject:_loginView.userPassTextField.text forKey:@"userPass"];
    
    
    NSString *name = [userDefaults objectForKey:@"userAccount"];
    NSLog(@"%@", name);
    
    
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


- (void)registerSuccess:(NSNotification *)noti {
    _loginView.userNameTextField.text = [noti.userInfo valueForKey:@"name"];
    _loginView.userPassTextField.text = [noti.userInfo valueForKey:@"pass"];
}

@end
