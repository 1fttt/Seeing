//
//  SEEResetPasswordViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/17.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEResetPasswordViewController.h"
#import "SEEResetPasswordView.h"
#import "Manager.h"
#import "SEEForgetModel.h"


@interface SEEResetPasswordViewController ()

@end

@implementation SEEResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _resetView = [[SEEResetPasswordView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_resetView];
    [_resetView initView];

    [_resetView.sureButton addTarget:self action:@selector(pressSure) forControlEvents:UIControlEventTouchUpInside];

}



- (void)pressSure {
    if (![_resetView.passwordTextfield.text isEqualToString:_resetView.repeatTextfield.text]) {
        [self showAlert:@"密码两次输入不同"];
    } else {
        Manager *manager = [Manager shareManager];
        [manager getPhoneNumber:_phoneStr andNewPassword:_resetView.repeatTextfield.text getBackresetModel:^(SEEResetPasswordModel * _Nonnull resetModel) {
            
            if ([resetModel.status isEqualToString:@"0"]) {
                [self showAlert:@"修改成功"];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"resetPassword" object:self userInfo:@{@"password":self->_resetView.repeatTextfield.text}];
                
                [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
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
    [self performSelector:@selector(dismissView) withObject:nil afterDelay:1.4];
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
