//
//  SEESubBlindPersonalCentreView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonalCentreView.h"
#import "SEESubBlindPersonCentreTableViewCell.h"
#import "SEEBlindPersonalCentreModel.h"
#import "Manager.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width

@implementation SEESubBlindPersonalCentreView

- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEESubBlindPersonCentreTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[SEESubBlindPersonCentreTableViewCell class] forCellReuseIdentifier:@"0row"];
    
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _sureButton.tintColor = [UIColor whiteColor];
    _sureButton.backgroundColor = [UIColor colorWithRed:0/255 green:210.0/255 blue:95.0/255 alpha:1];
    _sureButton.layer.cornerRadius = 25;
    _sureButton.titleLabel.font = [UIFont boldSystemFontOfSize:21];
    [_sureButton setTitle:@"保存" forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressSure) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_sureButton];
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(W - 60);
        make.height.mas_equalTo(50);
    }];
    _sureButton.hidden = YES;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    _textFieldArray = [[NSMutableArray alloc] init];
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 150;
    } else {
        return 65;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (indexPath.row == 0) {
        SEESubBlindPersonCentreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"0row" forIndexPath:indexPath];
        
        //需获取image
        [cell.headButton setImage:[UIImage imageNamed:@"tj.jpg"] forState:UIControlStateNormal];

        cell.nameLabel.text = @"姓  名:";
        cell.msgLabel.text = @"个人简介:";
        
        cell.nameTextField.text = [userDefaults objectForKey:@"name"];
        cell.msgTextField.text = [userDefaults objectForKey:@"msg"];
        
        cell.nameTextField.enabled = NO;
        cell.msgTextField.enabled = NO;
        
        cell.nameTextField.tag = 0;
        cell.msgTextField.tag = 1;
        
        [_textFieldArray addObject:cell.nameTextField];
        [_textFieldArray addObject:cell.msgTextField];
        
        return cell;
        
    } else {
        
        SEESubBlindPersonCentreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        NSArray *array = [NSArray arrayWithObjects:@"性   别:", @"电   话:", @"家庭住址:", @"邮   箱:", nil];
        
        NSString *gender = [userDefaults objectForKey:@"gender"];
        if ([gender isEqualToString:@"0"]) {
            gender = @"女";
        } else if ([gender isEqualToString:@"1"]){
            gender = @"男";
        } else {
            gender = @"尚未填写";
        }
        NSLog(@"%@\n %@\n%@\n%@", gender, [userDefaults objectForKey:@"phone"], [userDefaults objectForKey:@"email"], [userDefaults objectForKey:@"address"]);
        
        
        NSArray *textArray = [NSArray arrayWithObjects:gender, [userDefaults objectForKey:@"phone"], [userDefaults objectForKey:@"email"], [userDefaults objectForKey:@"address"], nil];
        
        
        NSLog(@"%@", textArray);
        cell.label.text = array[indexPath.row - 1];
        cell.textField.text = textArray[indexPath.row - 1];
        cell.textField.textColor = [UIColor colorWithWhite:0.3 alpha:1];
        

        cell.textField.enabled = NO;
        cell.textField.tag = indexPath.row + 1;
        
        [_textFieldArray addObject:cell.textField];
        

        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}


- (void)pressSure {

    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *gender = [[NSString alloc] init];
    if ([[_textFieldArray[2] text] isEqualToString:@"女"]) {
        gender = @"0";
    } else if ([[_textFieldArray[2] text] isEqualToString:@"男"]) {
        gender = @"1";
    }
    
    
    Manager *manager = [Manager shareManager];
    [manager updateInfBlock:^(SEEBlindPersonalCentreModel * _Nonnull updateInfModel) {
        
            
            [userDefaults setObject:[updateInfModel.data valueForKey:@"name"] forKey:@"name"];
            [userDefaults setObject:[updateInfModel.data phone] forKey:@"phone"];
            [userDefaults setObject:[updateInfModel.data email] forKey:@"email"];
            
            //[userDefaults setObject:[updateInfModel.data picture] forKey:@"picture"];
            
            [userDefaults setObject:[updateInfModel.data gender] forKey:@"gender"];
            [userDefaults setObject:[updateInfModel.data msg] forKey:@"msg"];
            [userDefaults setObject:[updateInfModel.data address] forKey:@"address"];
           dispatch_async(dispatch_get_main_queue(), ^{
               [_tableView reloadData];
           });
        
            
        
    } andName:[_textFieldArray[0] text] andIdStr:[userDefaults objectForKey:@"id"] andMsg:[_textFieldArray[1] text] andGender:gender andEmail:[_textFieldArray[5] text] andPhone:[_textFieldArray[3] text] andAddress:[_textFieldArray[4] text]];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_tableView reloadData];
//    });
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"finishEdit" object:self];
}


@end
