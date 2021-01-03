//
//  SEEVolunteerPersonalView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/21.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerPersonalView.h"
#import "SEEBlindPersonalTableViewCell.h"
#import "Masonry.h"
#define headButtonSize 110


@implementation SEEVolunteerPersonalView

- (void)initView {
    
    self.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
    
    [self addView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
    [self addSubview:_tableView];

    _tableView.scrollEnabled = NO;

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
            _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [cell.contentView addSubview:_headButton];
            
            _headButton.layer.cornerRadius = headButtonSize / 2;
            _headButton.layer.masksToBounds = YES;
            
 
            [_headButton setImage:[UIImage imageNamed:@"tj.jpg"] forState:UIControlStateNormal];
            
            
            
            [_headButton addTarget:self action:@selector(pressHead) forControlEvents:UIControlEventTouchUpInside];
            
            [_headButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(cell.contentView.mas_centerX);
                make.centerY.equalTo(cell.contentView.mas_centerY);
                make.width.mas_equalTo(headButtonSize);
                make.height.mas_equalTo(headButtonSize);
            }];
            
        
            _headButton.tag = 111;
            

            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            

            cell.nameLabel.text = [userDefaults objectForKey:@"name"];
            cell.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:250/255.0 alpha:1];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
            
        } else {
            
            SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
           _subTitleArray = [NSArray arrayWithObjects:@"详细资料", @"修改密码", nil];
            cell.subTitlelabel.text = _subTitleArray[indexPath.row - 1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            return cell;
            
        }
    } else {
         SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quit" forIndexPath:indexPath];
        cell.quitlabel.text = @"退出";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }
    return [[UITableViewCell alloc] init];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row != 0) {
        _cellNumber = (int)indexPath.row;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Vpush" object:self userInfo:@{@"text":_subTitleArray[indexPath.row - 1]}];
    } else if (indexPath.section == 1) {
         

        [[NSNotificationCenter defaultCenter] postNotificationName:@"VpushAlert" object:nil];
    }
}


- (void)addView {
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.text = @"个人中心";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(50);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(30);
    }];
}

- (void)pressHead {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressHeadV" object:self];

}
@end
