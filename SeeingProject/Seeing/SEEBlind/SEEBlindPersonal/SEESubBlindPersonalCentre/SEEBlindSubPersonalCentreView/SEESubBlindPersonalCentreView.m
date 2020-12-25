//
//  SEESubBlindPersonalCentreView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEESubBlindPersonalCentreView.h"
#import "SEESubBlindPersonCentreTableViewCell.h"
#import "Manager.h"

@implementation SEESubBlindPersonalCentreView

- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    [self addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEESubBlindPersonCentreTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[SEESubBlindPersonCentreTableViewCell class] forCellReuseIdentifier:@"0row"];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
        
        cell.textField.text = [userDefaults objectForKey:@"name"];
        cell.msgTextField.text = [userDefaults objectForKey:@"msg"];
        
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
        
        cell.label.text = array[indexPath.row - 1];
        cell.textField.text = textArray[indexPath.row - 1];
        
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}




@end
