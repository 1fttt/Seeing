//
//  SEEBlindGeneralInfoView.m
//  Seeing
//
//  Created by 房彤 on 2020/12/22.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindGeneralInfoView.h"
#import "Masonry.h"
#import "SEEBlindGeneralInfoTableViewCell.h"

@implementation SEEBlindGeneralInfoView

- (void)initView {
    
    self.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 80) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.layer.cornerRadius = 25;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"titleCell"];
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"section0"];
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"section1"];
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"section2"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 2;
    } else {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    } else if (indexPath.section == 0 && indexPath.row != 0) {
        return 100;
    } else if (indexPath.section == 1) {
        return 170;
    } else {
        return 70;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        SEEBlindGeneralInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell" forIndexPath:indexPath];
        
        NSArray *imageArray = [NSArray arrayWithObjects:@"taiyang", @"ziyuan", @"zixun-2", nil];
        [cell.titleImageView setImage:[UIImage imageNamed:imageArray[indexPath.section]]];
        
        NSArray *titleArray = [NSArray arrayWithObjects:@"时间与天气", @"音乐", @"资讯", nil];
        cell.titleLabel.text = titleArray[indexPath.section];
        return cell;
        
    }
    
    
    return [[UITableViewCell alloc] init];
    
}
@end
