//
//  SEEBlindPersonalContactViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalContactViewController.h"

@interface SEEBlindPersonalContactViewController ()

@end

@implementation SEEBlindPersonalContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    _contactView = [[SEEBlindPersonalContactView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_contactView];
    
    [_contactView initView];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
}


@end
