//
//  SEESubBlindPersonalCentreViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonalCentreViewController.h"
#import "SEESubBlindPersonalCentreView.h"

@interface SEESubBlindPersonalCentreViewController ()

@end

@implementation SEESubBlindPersonalCentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    _centreView = [[SEESubBlindPersonalCentreView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_centreView];
    [_centreView initView];
    
    
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
