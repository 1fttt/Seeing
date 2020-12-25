//
//  SEEBlindPersonalContactViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalContactViewController.h"
#import "SEEBlindContactAddViewController.h"
#import "Manager.h"

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

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tianjia"] style:UIBarButtonItemStylePlain target:self action:@selector(pressAdd)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"reload" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
}


- (void)pressAdd {
    
    SEEBlindContactAddViewController *addView = [[SEEBlindContactAddViewController alloc] init];
    addView.modalPresentationStyle = UIModalPresentationFullScreen;
    //[self presentViewController:addView animated:YES completion:nil];

    [self.navigationController pushViewController:addView animated:YES];
    
    
   
    
}


- (void)reloadTableView {

    NSString *idStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    
    Manager *manager = [Manager shareManager];
    [manager getContactBlock:^(SEEBlindContactModel * _Nonnull contactModel) {
        _contactView.contactModel = contactModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_contactView.tableView reloadData];
        });
        
    } error:^(NSError * _Nonnull error) {
        
    } andBlindID:idStr];
    
    

}




@end
