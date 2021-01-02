//
//  SEEVolunteerMainViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/5.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerMainViewController.h"
#import "SEEVolunteerMainView.h"

@interface SEEVolunteerMainViewController ()

@end

@implementation SEEVolunteerMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _mainView = [[SEEVolunteerMainView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_mainView];
    
    [_mainView initView];
    

}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];

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
