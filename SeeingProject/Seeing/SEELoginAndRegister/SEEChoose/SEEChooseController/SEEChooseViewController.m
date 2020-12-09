//
//  SEEChooseViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEChooseViewController.h"
#import "SEEChooseView.h"
#import "SEERegisterViewController.h"

@interface SEEChooseViewController ()

@end

@implementation SEEChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    _chooseView = [[SEEChooseView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_chooseView];
    [_chooseView viewInit];
    
    [_chooseView.blindButton addTarget:self action:@selector(pressBlind) forControlEvents:UIControlEventTouchUpInside];
    [_chooseView.volunteerButton addTarget:self action:@selector(pressVolunteer) forControlEvents:UIControlEventTouchUpInside];
   
    [_chooseView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    
   
}

- (void)pressBlind {
    SEERegisterViewController *registerView = [[SEERegisterViewController alloc] init];
    registerView.str = @"1";
    registerView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerView animated:YES completion:nil];
    
}

- (void)pressVolunteer {
    SEERegisterViewController *registerView = [[SEERegisterViewController alloc] init];
    registerView.str = @"0";
    registerView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerView animated:YES completion:nil];
    
}

- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}






@end
