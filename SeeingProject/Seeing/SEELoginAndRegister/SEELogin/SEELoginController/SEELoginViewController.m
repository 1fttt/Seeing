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
#import "SEEVolunteerMainViewController.h"
#import "SEEVolunteerUploadViewController.h"
#import "SEEVolunteerPersonalViewController.h"
#import "Manager.h"
#import "SEELoginModel.h"

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
    
- (void)viewDidAppear:(BOOL)animated {
    
    NSUserDefaults *userDafaults = [NSUserDefaults standardUserDefaults];
    if ([userDafaults objectForKey:@"userAccount"]) {
        NSLog(@"%@", [userDafaults objectForKey:@"userAccount"]);
        _avoidLogin = YES;
    }
    
    if (_avoidLogin == YES && !_isRegister) {
        
        _loginView.userNameTextField.text = [userDafaults objectForKey:@"userAccount"];
        _loginView.userPassTextField.text = [userDafaults objectForKey:@"userPass"];
        //[self pressLogin];
        _isRegister = NO;
    }
}


- (void)pressLogin {
    
    
    
    if (_loginView.userNameTextField.text.length > 0 && _loginView.userPassTextField.text.length > 0) {
        Manager *manager = [Manager shareManager];
        [manager loginPhoneNumber:_loginView.userNameTextField.text andPasswordStr:_loginView.userPassTextField.text getBackModel:^(SEELoginModel * _Nonnull loginBackModel) {
            
            if ([loginBackModel.msg isEqualToString:@"登录成功"]) {
                
                //存储账号密码
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:self->_loginView.userNameTextField.text forKey:@"userAccount"];
                [userDefaults setObject:self->_loginView.userPassTextField.text forKey:@"userPass"];
                
                [userDefaults setObject:[loginBackModel.data valueForKey:@"ID"] forKey:@"id"];
                [userDefaults setObject:[loginBackModel.data valueForKey:@"name"] forKey:@"name"];
                [userDefaults setObject:[loginBackModel.data phone] forKey:@"phone"];
                [userDefaults setObject:[loginBackModel.data type] forKey:@"type"];
                [userDefaults setObject:[loginBackModel.data email] forKey:@"email"];
                [userDefaults setObject:[loginBackModel.data picture] forKey:@"picture"];
                [userDefaults setObject:[loginBackModel.data gender] forKey:@"gender"];
                [userDefaults setObject:[loginBackModel.data msg] forKey:@"msg"];
                [userDefaults setObject:[loginBackModel.data address] forKey:@"address"];
                [userDefaults setObject:[loginBackModel.data number] forKey:@"number"];
                
            
                [self loginSuccess];
            } else {
                [self showAlertStr:loginBackModel.msg actionStr:@"确定"];
            }

        } error:^(NSError * _Nonnull error) {
            [self showAlertStr:@"登录失败" actionStr:@"确定"];
        }];
        
    } else {
        [self showAlertStr:@"输入不完整" actionStr:@"确定"];
    
    }
    
}

- (void)pressRegister {
    SEEChooseViewController *chooseView = [[SEEChooseViewController alloc] init];
    chooseView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:chooseView animated:YES completion:nil];
    _isRegister = YES;
}



//登录成功
- (void)loginSuccess {
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefaults objectForKey:@"userAccount"];
    NSLog(@"%@", name);
    NSLog(@"%@", [userDefaults objectForKey:@"id"]);
    NSLog(@"%@", [userDefaults objectForKey:@"phone"]);
    NSLog(@"%@", [userDefaults objectForKey:@"type"]);
    
    if ([[userDefaults objectForKey:@"type"] isEqualToString:@"1"]) {
        [self blindLogin];
    } else if ([[userDefaults objectForKey:@"type"] isEqualToString:@"0"]) {
        [self volunteerLogin];
    }
    
    
    
    
}

- (void)blindLogin {
    //视频通话
    SEEBlindVideoCallViewController *videoCallView = [[SEEBlindVideoCallViewController alloc] init];
    
    UINavigationController *videoCallNav = [[UINavigationController alloc] initWithRootViewController:videoCallView];
    videoCallNav.tabBarItem.title = @"视频通话";
    videoCallNav.tabBarItem.image = [UIImage imageNamed:@"shipintonghua"];
    videoCallNav.tabBarItem.selectedImage = [UIImage imageNamed:@"shipintonghua-2"];
    
    //常用信息
    SEEBlindGeneralInfoViewController *generalInfoView = [[SEEBlindGeneralInfoViewController alloc] init];
    UINavigationController *generalInfoNav = [[UINavigationController alloc] initWithRootViewController:generalInfoView];
    generalInfoNav.tabBarItem.title = @"常用信息";
    generalInfoNav.tabBarItem.image = [UIImage imageNamed:@"changyongxinxi"];
    generalInfoNav.tabBarItem.selectedImage = [UIImage imageNamed:@"changyongxinxi-2"];
    
    //我的
    SEEBlindPersonalViewController *personalView = [[SEEBlindPersonalViewController alloc] init];
    UINavigationController *personalNav = [[UINavigationController alloc] initWithRootViewController:personalView];
    personalNav.tabBarItem.title = @"个人中心";
    personalNav.tabBarItem.image = [UIImage imageNamed:@"wode-3"];
    personalNav.tabBarItem.selectedImage = [UIImage imageNamed:@"wode-2"];
    
    NSArray *array = [NSArray arrayWithObjects:videoCallNav, generalInfoNav, personalNav, nil];
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = array;
    
    //设置选中状态的颜色
    tabbarController.tabBar.tintColor = [UIColor colorWithRed:0/255 green:143.0/255 blue:211.0/255 alpha:1];
    
    tabbarController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tabbarController animated:YES completion:nil];
}

- (void)volunteerLogin {
    
    //视频
    SEEVolunteerMainViewController *mainView = [[SEEVolunteerMainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
    
    mainNav.tabBarItem.title = @"接听视频";
    mainNav.tabBarItem.image = [UIImage imageNamed:@""];
    mainNav.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    
    //盲道上传
    SEEVolunteerUploadViewController *upLoadView = [[SEEVolunteerUploadViewController alloc] init];
    UINavigationController *upLoadNav = [[UINavigationController alloc] initWithRootViewController:upLoadView];
    
    upLoadNav.tabBarItem.title = @"盲道上传";
    upLoadNav.tabBarItem.image = [UIImage imageNamed:@""];
    upLoadNav.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    
    //个人中心
    SEEVolunteerPersonalViewController *personView= [[SEEVolunteerPersonalViewController alloc] init];
    UINavigationController *personNav = [[UINavigationController alloc] initWithRootViewController:personView];
    
    personNav.tabBarItem.title = @"个人中心";
    personNav.tabBarItem.image = [UIImage imageNamed:@""];
    personNav.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    
    NSArray *array = [NSArray arrayWithObjects:mainNav, upLoadNav, personNav, nil];
    
    UITabBarController *tb = [[UITabBarController alloc] init];
    tb.viewControllers = array;
    
    //设置选中状态的颜色
    tb.tabBar.tintColor = [UIColor colorWithRed:0/255 green:143.0/255 blue:211.0/255 alpha:1];
    tb.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tb animated:YES completion:nil];
    
}

- (void)registerSuccess:(NSNotification *)noti {
    _loginView.userNameTextField.text = [noti.userInfo valueForKey:@"name"];
    _loginView.userPassTextField.text = [noti.userInfo valueForKey:@"pass"];
}

- (void)showAlertStr:(NSString *)alertStr actionStr:(NSString *)actionStr {

    UIAlertAction *action = [UIAlertAction actionWithTitle:actionStr style:UIAlertActionStyleDefault handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertStr message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    //block();
}

@end
