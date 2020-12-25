//
//  SEEBlindPersonalContactView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/23.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalContactView.h"
#import "SEEBlindPersonalContactTableViewCell.h"
#import "Manager.h"
#import "Masonry.h"


@implementation SEEBlindPersonalContactView

- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEEBlindPersonalContactTableViewCell class] forCellReuseIdentifier:@"contactCell"];
    
    
    NSString *idStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    _contactModel = [[SEEBlindContactModel alloc] init];
    
    Manager *manager = [Manager shareManager];
    [manager getContactBlock:^(SEEBlindContactModel * _Nonnull contactModel) {
        _contactModel = contactModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
        
    } error:^(NSError * _Nonnull error) {
        
    } andBlindID:idStr];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contactModel.data.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SEEBlindPersonalContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    PersonModel *data = _contactModel.data[indexPath.row];
    cell.nameLabel.text = data.name;
    cell.phoneLabel.text = [NSString stringWithFormat:@"%@-%@", data.relation, data.phone];
    
    return cell;
    //return [[UITableViewCell alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (_contactModel.data.count == 0) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.text = @"目前无紧急联系人";
        label.font = [UIFont systemFontOfSize:19];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithWhite:0.8 alpha:1];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.width.mas_equalTo(180);
            make.height.mas_equalTo(50);
        }];
        return label;
    }
    
    return [[UIView alloc] init];
}


@end
