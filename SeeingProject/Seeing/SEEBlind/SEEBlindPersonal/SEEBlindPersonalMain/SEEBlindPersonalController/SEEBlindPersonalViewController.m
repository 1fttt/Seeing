//
//  SEEBlindPersonalViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindPersonalViewController.h"
#import "SEEBlindPersonalView.h"
#import "SEESubBlindPersonalCentreViewController.h"
#import "SEEBlindSubPersonalModifyViewController.h"
#import "SEEBlindPersonalContactViewController.h"
#import "Masonry.h"
#import "SpeechManager.h"

@interface SEEBlindPersonalViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation SEEBlindPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self addView];
    
    _personalView = [[SEEBlindPersonalView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_personalView];
    [_personalView initView];
    
    self.navigationItem.title = @"个人中心";
    
    //点击cell 接收通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellPush:) name:@"push" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertPush) name:@"pushAlert" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickHeadImage) name:@"pressHead" object:nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"个人中心页面"];
}


//执行点击cell push
- (void)cellPush:(NSNotification *)noti {
    
    SpeechManager *manager = [SpeechManager shareSpeech];
    
    
    if (_personalView.cellNumber == 1) {
        SEESubBlindPersonalCentreViewController *centreView = [[SEESubBlindPersonalCentreViewController alloc] init];
        [self.navigationController pushViewController:centreView animated:YES];
        
        [manager speech:[noti.userInfo objectForKey:@"text"]];
        
    } else if (_personalView.cellNumber == 2) {
        SEEBlindSubPersonalModifyViewController *modifyView = [[SEEBlindSubPersonalModifyViewController alloc] init];
        [self.navigationController pushViewController:modifyView animated:YES];
        
        [manager speech:[noti.userInfo objectForKey:@"text"]];
        
    } else if (_personalView.cellNumber == 3) {
        SEEBlindPersonalContactViewController *contactView = [[SEEBlindPersonalContactViewController alloc] init];
        [self.navigationController pushViewController:contactView animated:YES];
        
        [manager speech:[noti.userInfo objectForKey:@"text"]];
    }
}

- (void)alertPush {
    
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"退出"];
    
    _alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [manager speech:@"已退出登录"];
        
        NSLog(@"退出");
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"注销账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [manager speech:@"已注销账号"];
        
        //清空NSUserDefault
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        NSLog(@"%@", appDomain);
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [manager speech:@"取消"];
    }];
    
    [_alert addAction:action1];
    [_alert addAction:action2];
    [_alert addAction:action3];
    

    [self presentViewController:_alert animated:YES completion:nil];
}

- (void)pickHeadImage {
    
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"点击头像，进行更换"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换头像" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cannelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    static NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    
    //判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [manager speech:@"已选择相机"];
            sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }];
        
        [alert addAction:camera];
    }
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [manager speech:@"已选择相册"];
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }];
    
    [alert addAction:libraryAction];
    [alert addAction:cannelAction];
    
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:alert animated:YES completion:nil];
    
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.delegate = self;
//    imagePickerController.allowsEditing = YES;
//    imagePickerController.sourceType = sourceType;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pickAlert" object:self];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    [_personalView.headButton setImage:image forState:UIControlStateNormal];
    
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"更换成功"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//
////圆形的图片
//-(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
//    UIGraphicsBeginImageContext(image.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context,0); //边框线
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
//    CGContextAddEllipseInRect(context, rect);
//    CGContextClip(context);
//
//    [image drawInRect:rect];
//    CGContextAddEllipseInRect(context, rect);
//    CGContextStrokePath(context);
//    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newimg;
//}


@end
