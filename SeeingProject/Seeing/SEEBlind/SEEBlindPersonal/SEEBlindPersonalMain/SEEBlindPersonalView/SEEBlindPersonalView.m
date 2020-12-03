//
//  SEEBlindPersonalView.m
//  Seeing
//
//  Created by 房彤 on 2020/11/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalView.h"
#import "SEEBlindPersonalTableViewCell.h"


@implementation SEEBlindPersonalView

- (void)initView {
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEEBlindPersonalTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[SEEBlindPersonalTableViewCell class] forCellReuseIdentifier:@"0row"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 260;
    } else {
        return 60;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"0row" forIndexPath:indexPath];
        [cell.headButton setImage:[UIImage imageNamed:@"tj.jpg"] forState:UIControlStateNormal];
        //[cell.headButton addTarget:self action:@selector(pressHead) forControlEvents:UIControlEventTouchUpInside];
        
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bj.jpg"]];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        cell.nameLabel.text = [userDefaults objectForKey:@"name"];
        
        
    } else {
        
        SEEBlindPersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        NSArray *array = [NSArray arrayWithObjects:@"详细资料", @"修改密码", @"紧急联系人", nil];
        cell.subTitlelabel.text = array[indexPath.row - 1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    return [[UITableViewCell alloc] init];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _cellNumber = (int)indexPath.row;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:nil];
}







@end
