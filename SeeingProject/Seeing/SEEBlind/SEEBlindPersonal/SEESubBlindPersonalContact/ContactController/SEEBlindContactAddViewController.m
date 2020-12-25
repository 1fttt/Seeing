//
//  SEEBlindContactAddViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/25.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindContactAddViewController.h"
#import "Manager.h"
#import "SEEForgetModel.h"

@interface SEEBlindContactAddViewController ()

@end

@implementation SEEBlindContactAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _addView = [[SEEBlindContactAddView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_addView];
 
    [_addView initView];
    
    [_addView.sureButton addTarget:self action:@selector(pressSure) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pressSure {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *idStr = [userDefaults objectForKey:@"id"];
    if (_addView.nameTextfield.text.length > 0 && _addView.relationTextfield.text.length > 0 && _addView.phoneTextfield.text.length > 0) {
    
        Manager *manager = [Manager shareManager];
        [manager addContactBlock:^(SEEForgetModel * _Nonnull contactBackModel) {
            
            if (contactBackModel.status == 0) {
                [self showAlertStr:contactBackModel.msg actionStr:@"确定"];
                
                
            } else {
                [self showAlertStr:contactBackModel.msg actionStr:@"确定"];
            }
        } error:^(NSError * _Nonnull error) {
            [self showAlertStr:@"添加失败" actionStr:@"确定"];
        } andBlindID:idStr andName:_addView.nameTextfield.text andRelation:_addView.relationTextfield.text andPhone:_addView.phoneTextfield.text];
  
    } else {
        [self showAlertStr:@"输入不完整" actionStr:@"确定"];
    }
}


- (void)showAlertStr:(NSString *)alertStr actionStr:(NSString *)actionStr {

    UIAlertAction *action = [UIAlertAction actionWithTitle:actionStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([alertStr isEqualToString:@"添加成功"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertStr message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];

}



@end
