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
    self.view.backgroundColor = [UIColor whiteColor];
    
    _centreView = [[SEESubBlindPersonalCentreView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_centreView];
    [_centreView initView];
    
    _rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    self.navigationItem.rightBarButtonItem = _rightItem;
    
    _isEdit = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressEdit) name:@"finishEdit" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)pressEdit {
    if (_isEdit == NO) {
        for (UITextField *textField in _centreView.textFieldArray) {
            textField.enabled = YES;
            textField.textColor = [UIColor blackColor];
        }
        
        _rightItem.title = @"取消";
        _isEdit = YES;
        
        _centreView.sureButton.hidden = NO;
        
    } else {
        
        for (UITextField *textField in _centreView.textFieldArray) {
            textField.enabled = NO;
            textField.textColor = [UIColor colorWithWhite:0.3 alpha:1];
        }
        _rightItem.title = @"编辑";
        _isEdit = NO;
        
        _centreView.sureButton.hidden = YES;
        
    }
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
