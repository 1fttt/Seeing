//
//  SEEForgetViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/16.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEForgetViewController.h"
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
    
    Manager *manager = [[Manager alloc] init];
    [manager forgetPhoneNumber:_numberStr getForgetModel:^(SEEForgetModel * _Nonnull forgetModel) {
        if ([forgetModel.status isEqualToString:@"0"]) {
            NSLog(@"短信验证码发送成功");
        } else {
            NSLog(@"失败");
        }
    } error:^(NSError * _Nonnull error) {
        
    }];
    
}


- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
