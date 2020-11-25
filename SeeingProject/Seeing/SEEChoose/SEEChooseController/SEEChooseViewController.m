//
//  SEEChooseViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEChooseViewController.h"
#import "SEEChooseView.h"

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
