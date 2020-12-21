//
//  SEEBlindSubPersonalModifyViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindSubPersonalModifyViewController.h"
#import "Manager.h"
#import "SEEForgetModel.h"

@interface SEEBlindSubPersonalModifyViewController ()

@end

@implementation SEEBlindSubPersonalModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _modifyView = [[SEEBlindSubPersonalModifyView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_modifyView];
    
    [_modifyView initView];
    
    //self.navigationItem.backBarButtonItem = _modifyView.backButton;
    //self.navigationItem.leftBarButtonItem = _modifyView.backLabel;
    
    [_modifyView.sureButton addTarget:self action:@selector(pressSure) forControlEvents:UIControlEventTouchUpInside];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _phoneStr = [NSString stringWithString:[userDefaults objectForKey:@"userAccount"]];

}

- (void)pressSure {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", _modifyView.repeatTextfield.text);
    NSLog(@"%@", _modifyView.passwordTextfield.text);
    if (![_modifyView.passwordTextfield.text isEqualToString:_modifyView.repeatTextfield.text]) {
        [self showAlert:@"密码两次输入不同"];
    } else if (![_modifyView.oldPasswordTextfield.text isEqualToString: [userDefaults objectForKey:@"userPass"]]) {
        [self showAlert:@"旧密码输入错误"];
    } else {
        NSLog(@"%@", _modifyView.repeatTextfield.text);
        NSLog(@"%@", _modifyView.passwordTextfield.text);
        
        Manager *manager = [Manager shareManager];
        
        [manager getID:[userDefaults objectForKey:@"id"] andOldPassword:_modifyView.oldPasswordTextfield.text  angNewPassword:_modifyView.passwordTextfield.text  getbackUpdateBlock:^(SEEResetPasswordModel * _Nonnull updateModel) {
            if ([updateModel.status isEqualToString:@"0"]) {
                [self showAlert:@"修改成功"];
                //[userDefaults setObject:_modifyView.repeatTextfield.text forKey:@"userPass"];
            } else {
                [self showAlert:@"修改失败"];
            }
        } error:^(NSError * _Nonnull error) {
            [self showAlert:@"修改失败"];
        }];
        
        
    }
}


- (void)showAlert:(NSString *)str {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:str preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    [self performSelector:@selector(dismissView) withObject:nil afterDelay:3];
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
