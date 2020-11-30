//
//  SEERegisterViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEERegisterViewController.h"
#import "SEERegisterModel.h"
#import "Manager.h"

@interface SEERegisterViewController ()

@end

@implementation SEERegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _registerView = [[SEERegisterView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_registerView];
    [_registerView initView];
    
    [_registerView.cancelButton addTarget:self action:@selector(pressCancel) forControlEvents:UIControlEventTouchUpInside];
    [_registerView.sureButton addTarget:self action:@selector(pressSure) forControlEvents:UIControlEventTouchUpInside];
}


//点击取消注册
- (void)pressCancel {
    
    UIViewController *controller = self;
    while(controller.presentingViewController != nil){
        controller = controller.presentingViewController;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}


//点击确定注册
- (void)pressSure {
    
    Manager *manager = [Manager shareManager];
    [manager registerTypeStr:_str andName:_registerView.userNameTextField.text andNumber:_registerView.userNumberTextField.text andPass:_registerView.userPassTextField.text getBackModel:^(SEERegisterModel * _Nonnull registerBackModel) {
        
        if ([registerBackModel.msg isEqualToString:@"注册成功"]) {
            NSLog(@"注册成功！！！");
            [self sureSuccess];
        } else if ([registerBackModel.msg isEqualToString:@"手机号码已存在"]) {
            NSLog(@"手机号已存在");
        } else if ([registerBackModel.msg isEqualToString:@"信息不完全"]) {
            NSLog(@"信息不完全");
        } else if ([registerBackModel.msg isEqualToString:@"注册失败"]) {
            NSLog(@"注册失败");
        }
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    

}


- (void)sureSuccess {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nameAndPass" object:self userInfo:@{@"name":_registerView.userNameTextField.text, @"pass":_registerView.userPassTextField.text}];
    //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    
    [self pressCancel];
}



@end
