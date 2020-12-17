//
//  SEEForgetViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEForgetViewController.h"
#import "SEEResetPasswordViewController.h"
#import "SEEForgetModel.h"
#import "Manager.h"

@interface SEEForgetViewController ()

@end

@implementation SEEForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _forgetView = [[SEEForgetView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_forgetView];
    _forgetView.numberStr = [NSString stringWithString:_numberStr];
    [_forgetView initView];
  
    [_forgetView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_forgetView.nextButton addTarget:self action:@selector(pressNext) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)pressNext {
    
    Manager *manager = [Manager shareManager];
       [manager getVerifyPhoneNumber:_numberStr andCode:_forgetView.textfield.text getBackVerifyModel:^(SEEVerifyModel * _Nonnull verifyModel) {

           if ([verifyModel.status isEqualToString:@"0"]) {
               NSLog(@"验证成功");
               
               SEEResetPasswordViewController *resetView = [[SEEResetPasswordViewController alloc] init];
                resetView.modalPresentationStyle = UIModalPresentationFullScreen;
               resetView.phoneStr = [NSString stringWithString:self->_numberStr];
                [self presentViewController:resetView animated:YES completion:nil];

           } else {
               [self failVerify];
               [self dismissFailAlert];
           }

       } error:^(NSError * _Nonnull error) {
           [self failVerify];
           [self dismissFailAlert];
       }];
       
}

- (void)failVerify{
    
    UIAlertController *failAlert = [UIAlertController alertControllerWithTitle:@"验证失败" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:failAlert animated:YES completion:nil];
    [self performSelector:@selector(dismissFailAlert) withObject:nil afterDelay:1.4];
    
}

- (void)dismissFailAlert {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
