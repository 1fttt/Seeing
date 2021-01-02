//
//  SEEVolunteerPersonalViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/12/5.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEVolunteerPersonalViewController.h"
#import "SEESubBlindPersonalCentreViewController.h"
#import "SEEBlindSubPersonalModifyViewController.h"
#import "SEEBlindPersonalContactViewController.h"
#import "Manager.h"
#import "SEEBlindImageModel.h"

@interface SEEVolunteerPersonalViewController ()

@end

@implementation SEEVolunteerPersonalViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _personalView = [[SEEVolunteerPersonalView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_personalView];
    [_personalView initView];
    
    //self.navigationItem.title = @"个人中心";
    
    //点击cell 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellPush) name:@"push" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertPush) name:@"pushAlert" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickHeadImage) name:@"pressHeadV" object:nil];
    
}



- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}



//执行点击cell push
- (void)cellPush {
    if (_personalView.cellNumber == 1) {
        SEESubBlindPersonalCentreViewController *centreView = [[SEESubBlindPersonalCentreViewController alloc] init];
        [self.navigationController pushViewController:centreView animated:YES];
        
    } else if (_personalView.cellNumber == 2) {
        SEEBlindSubPersonalModifyViewController *modifyView = [[SEEBlindSubPersonalModifyViewController alloc] init];
        [self.navigationController pushViewController:modifyView animated:YES];
    }
}

- (void)alertPush {
    
    
    _alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"退出");
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"注销账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"关闭");
        
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        NSLog(@"%@", appDomain);
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isQuit" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [_alert addAction:action1];
    [_alert addAction:action2];
    [_alert addAction:action3];
    
    
    [self presentViewController:_alert animated:YES completion:nil];
}


- (void)pickHeadImage {
    

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换头像" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cannelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    static NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    
    //判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }];
        
        [alert addAction:camera];
    }
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
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
    
    //UIImage转换为NSData，第二个参数为压缩倍数
    NSData *imageData = UIImageJPEGRepresentation(image,0.6f);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *idStr = [NSString stringWithString:[userDefaults objectForKey:@"id"]];
    
    
    
    Manager *manager = [Manager shareManager];
    [manager getImageBlock:^(SEEBlindImageModel * _Nonnull imageModel) {
        NSLog(@"%@\n%@", [imageModel.data uri], [imageModel.data url]);
    } andID:idStr andImageData:imageData];
    
    
    [_personalView.headButton setImage:image forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
