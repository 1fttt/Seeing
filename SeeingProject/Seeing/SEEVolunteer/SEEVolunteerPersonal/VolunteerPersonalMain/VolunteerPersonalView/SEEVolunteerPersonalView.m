//
//  SEEVolunteerPersonalView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/21.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerPersonalView.h"
#import "SEEBlindPersonalTableViewCell.h"

@implementation SEEVolunteerPersonalView

- (void)initView {
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEEBlindPersonalTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[SEEBlindPersonalTableViewCell class] forCellReuseIdentifier:@"0row"];
    [_tableView registerClass:[SEEBlindPersonalTableViewCell class] forCellReuseIdentifier:@"quit"];

    _tableView.sectionHeaderHeight= 10;
     
    _tableView.sectionFooterHeight= 10;
    
    _tableView.tableHeaderView= [[UIView alloc]initWithFrame:CGRectMake(0.0f,0.0f,_tableView.bounds.size.width,0.01f)];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 250;
    } else {
        return 65;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"0row" forIndexPath:indexPath];
            //[cell.headButton setImage:[UIImage imageNamed:@"tj.jpg"] forState:UIControlStateNormal];

            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            cell.nameLabel.text = [userDefaults objectForKey:@"name"];
            
            
        } else {
            
            SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            NSArray *array = [NSArray arrayWithObjects:@"详细资料", @"修改密码", nil];
            cell.subTitlelabel.text = array[indexPath.row - 1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
    } else {
         SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quit" forIndexPath:indexPath];
        cell.quitlabel.text = @"退出";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return [[UITableViewCell alloc] init];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _cellNumber = (int)indexPath.row;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:nil];
    } else {
         
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushAlert" object:nil];
    }
}

@end
