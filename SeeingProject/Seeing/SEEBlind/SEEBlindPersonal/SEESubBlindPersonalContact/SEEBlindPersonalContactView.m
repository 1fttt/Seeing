//
//  SEEBlindPersonalContactView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/23.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalContactView.h"
#import "SEEBlindPersonalContactTableViewCell.h"
#import "Masonry.h"


@implementation SEEBlindPersonalContactView

- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEEBlindPersonalContactTableViewCell class] forCellReuseIdentifier:@"contactCell"];
    
    _linkmanArray = [[NSMutableArray alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return _linkmanArray.count;
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SEEBlindPersonalContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    cell.nameLabel.text = @"房彤";
    cell.phoneLabel.text = [NSString stringWithFormat:@"老大-13992934483"];
    
    return cell;
    //return [[UITableViewCell alloc] init];
}

@end
