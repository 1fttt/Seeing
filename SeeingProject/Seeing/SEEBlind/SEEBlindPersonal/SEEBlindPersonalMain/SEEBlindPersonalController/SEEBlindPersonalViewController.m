//
//  SEEBlindPersonalViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalViewController.h"
#import "SEEBlindPersonalView.h"
#import "SEESubBlindPersonalCentreViewController.h"
#import "SEEBlindSubPersonalModifyViewController.h"
#import "SEEBlindPersonalContactViewController.h"

@interface SEEBlindPersonalViewController ()

@end

@implementation SEEBlindPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _personalView = [[SEEBlindPersonalView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_personalView];
    [_personalView initView];
    
    self.navigationItem.title = @"个人中心";
    
    //点击cell 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellPush) name:@"push" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertPush) name:@"pushAlert" object:nil];
    
}




//执行点击cell push
- (void)cellPush {
    if (_personalView.cellNumber == 1) {
        SEESubBlindPersonalCentreViewController *centreView = [[SEESubBlindPersonalCentreViewController alloc] init];
        [self.navigationController pushViewController:centreView animated:YES];
        
    } else if (_personalView.cellNumber == 2) {
        SEEBlindSubPersonalModifyViewController *modifyView = [[SEEBlindSubPersonalModifyViewController alloc] init];
        [self.navigationController pushViewController:modifyView animated:YES];
    } else if (_personalView.cellNumber == 3) {
        SEEBlindPersonalContactViewController *contactView = [[SEEBlindPersonalContactViewController alloc] init];
        [self.navigationController pushViewController:contactView animated:YES];
    }
}

- (void)alertPush {
    
    
    _alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"退出");
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"注销账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"关闭");
        
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        NSLog(@"%@", appDomain);
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [_alert addAction:action1];
    [_alert addAction:action2];
    [_alert addAction:action3];
    
    
    [self presentViewController:_alert animated:YES completion:nil];
}

@end
