//
//  SEEBlindPersonalViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalViewController.h"
#import "SEEBlindPersonalView.h"
#import "SEESubBlindPersonalCentreViewController.h"
#import "SEEBlindSubPersonalModifyViewController.h"
#import "SEEBlindPersonalContactViewController.h"

@interface SEEBlindPersonalViewController ()

@end

@implementation SEEBlindPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _personalView = [[SEEBlindPersonalView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_personalView];

    [_personalView initView];
    
    //点击cell 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellPush) name:@"push" object:nil];
    
}


//执行点击cell push
- (void)cellPush {
    if (_personalView.cellNumber == 0) {
        SEESubBlindPersonalCentreViewController *centreView = [[SEESubBlindPersonalCentreViewController alloc] init];
        [self.navigationController pushViewController:centreView animated:YES];
        
    } else if (_personalView.cellNumber == 1) {
        SEEBlindSubPersonalModifyViewController *modifyView = [[SEEBlindSubPersonalModifyViewController alloc] init];
        [self.navigationController pushViewController:modifyView animated:YES];
    } else if (_personalView.cellNumber == 2) {
        SEEBlindPersonalContactViewController *contactView = [[SEEBlindPersonalContactViewController alloc] init];
        [self.navigationController pushViewController:contactView animated:YES];
    }
}

@end
