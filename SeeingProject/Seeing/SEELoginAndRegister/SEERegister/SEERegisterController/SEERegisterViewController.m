//
//  SEERegisterViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEERegisterViewController.h"

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

- (void)pressCancel {
    UIViewController *controller = self;
    while(controller.presentingViewController != nil){
        controller = controller.presentingViewController;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
    //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}

- (void)pressSure {
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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
