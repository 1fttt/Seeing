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
    
    //手机号码不合法
    if (![self isPureNumber:_registerView.userNumberTextField.text] || _registerView.userNumberTextField.text.length != 11) {
        
        [self showAlertStr:@"请输入合法手机号" actionStr:@"重新输入"];
        
    } else {
        
        Manager *manager = [Manager shareManager];
        [manager registerTypeStr:_str andName:_registerView.userNameTextField.text andNumber:_registerView.userNumberTextField.text andPass:_registerView.userPassTextField.text getBackModel:^(SEERegisterModel * _Nonnull registerBackModel) {
            
            if ([registerBackModel.msg isEqualToString:@"注册成功"]) {
                [self showAlertStr:registerBackModel.msg actionStr:@"继续登录"];
                
                
            } else if ([registerBackModel.msg isEqualToString:@"电话号码已存在"]) {
                [self showAlertStr:registerBackModel.msg actionStr:@"重新输入"];
                
            } else if ([registerBackModel.msg isEqualToString:@"信息不完善"]) {
                NSLog(@"信息不完全");
                
                [self showAlertStr:registerBackModel.msg actionStr:@"重新输入"];
                
            } else if ([registerBackModel.msg isEqualToString:@"注册失败"]) {
                NSLog(@"注册失败");
                
                [self showAlertStr:registerBackModel.msg actionStr:@"确定"];
                
            }
//            else {
//
//                [self showAlertStr:registerBackModel.msg actionStr:@"继续登录"];
//            }
            
            
        } error:^(NSError * _Nonnull error) {
            NSLog(@"请求失败");
        }];
    }
    
    
    
}


- (void)sureSuccess {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nameAndPass" object:self userInfo:@{@"name":_registerView.userNumberTextField.text, @"pass":_registerView.userPassTextField.text}];
    //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    
    [self pressCancel];
}


//判断是否是纯数字
- (BOOL)isPureNumber:(NSString *)str {
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (str.length > 0) {
        return NO;
    } else {
        return YES;
    }
}

//点击注册显示的警告框
- (void)showAlertStr:(NSString *)alertStr actionStr:(NSString *)actionStr {
//- (void)showAlertStr:(NSString *)alertStr actionStr:(NSString *)actionStr press:(void (^) (void))block {
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([actionStr isEqualToString:@"继续登录"]) {
            [self sureSuccess];
        }
        
    }];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertStr message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    //block();
}



@end
