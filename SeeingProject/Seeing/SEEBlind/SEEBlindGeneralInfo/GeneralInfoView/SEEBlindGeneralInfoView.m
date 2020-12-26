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
#import "UILabel+Touch.h"
#import "SpeechManager.h"
#import "Manager.h"

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
    
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"timeCell"];
    [_tableView registerClass:[SEEBlindGeneralInfoTableViewCell class] forCellReuseIdentifier:@"weatherCell"];
    
    
    Manager *manager = [Manager shareManager];
    [manager getWeatherBlock:^(SEEBlindWeatherModel * _Nonnull weatherModel) {
        
        _weatherModel = weatherModel;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
        
    } andCityStr:@"西安"];
    
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
        return 125;
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
        
        [cell.titleLabel touch];
        
        return cell;
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        //时间
        
        _timeCellArray = [[NSMutableArray alloc] init];
    
        SEEBlindGeneralInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeCell" forIndexPath:indexPath];

        NSDate *currentDate = [NSDate date];//获取当前时间，日期

        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"hh:mm"];
        NSString *timeString = [timeFormatter stringFromDate:currentDate];
        NSLog(@"dateString:%@",timeString);
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSLog(@"%@", dateString);
        NSLog(@"%@", [self weekdayStringFromDate:currentDate]);
        
        cell.timeLabel.text = timeString;
        cell.dateLabel.text = dateString;
        cell.weekLabel.text = [self weekdayStringFromDate:currentDate];
        
        [_timeCellArray addObject:cell.timeLabel.text];
        [_timeCellArray addObject:cell.dateLabel.text];
        [_timeCellArray addObject:cell.weekLabel.text];
        
        return cell;
            
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        
        SEEBlindGeneralInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
        cell.tempLabel.text = [NSString stringWithFormat:@"%@℃", _weatherModel.tem];
        cell.cityLabel.text = @"西安";
        
        [cell.locationImageView setImage:[UIImage imageNamed:@"dingwei"]];
        
        cell.tempMaxMinLabel.text = [NSString stringWithFormat:@"%@/%@", _weatherModel.tem1, _weatherModel.tem2];
        
        cell.weaLabel.text = _weatherModel.wea;
        
        [cell.weatherImageView setImage:[UIImage imageNamed:_weatherModel.wea_img]];
        
        return cell;
    }
    
    
    return [[UITableViewCell alloc] init];
    
}



#pragma mark 获取今天星期几

- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {

    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];

    [calendar setTimeZone: timeZone];

    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;

    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekday objectAtIndex:theComponents.weekday];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        SpeechManager *manager = [SpeechManager shareSpeech];
        NSMutableString *string = [[NSMutableString alloc] init];
        [string appendFormat:@"%@, %@, %@", _timeCellArray[0], _timeCellArray[1], _timeCellArray[2]];
        [manager speech:string];
        
    }
}


@end
