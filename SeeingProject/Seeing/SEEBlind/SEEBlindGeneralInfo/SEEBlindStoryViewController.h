//
//  SEEBlindStoryViewController.h
//  Seeing
//
//  Created by 房彤 on 2020/12/30.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEBlindStoryViewController : UIViewController

@property (nonatomic, copy) NSString *urlStr;

@property (nonatomic, strong) WKWebView *wkWebView;

@end

NS_ASSUME_NONNULL_END
