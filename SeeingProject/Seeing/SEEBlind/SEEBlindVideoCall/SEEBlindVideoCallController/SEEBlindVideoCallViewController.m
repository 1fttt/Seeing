//
//  SEEBlindVideoCallViewController.m
//  Seeing
//
//  Created by 房彤 on 2020/11/26.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SEEBlindVideoCallViewController.h"
#import "SpeechManager.h"
#import "Manager.h"
#import "SEEBlindScanModel.h"

@interface SEEBlindVideoCallViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@end

@implementation SEEBlindVideoCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"视频通话";
    
    _callView = [[SEEBlindVideoCallView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_callView];
    
    [_callView initView];
    
    [_callView.scanButton addTarget:self action:@selector(pressScan) forControlEvents:UIControlEventTouchUpInside];
    
    

}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
    SpeechManager *manager = [SpeechManager shareSpeech];
    [manager speech:@"视频通话页面"];
}


- (void)pressScan {
    static NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换头像" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cannelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
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
    
    Manager *manager = [Manager shareManager];
    [manager getScanBlock:^(SEEBlindScanBDModel *model) {
        NSLog(@"%@", [model.result[0] keyword]);
        
        self->_keyword = [NSString stringWithString:[model.result[0] keyword]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"识别结果" message:_keyword preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:action];
        [picker presentViewController:alert animated:NO completion:nil];
        SpeechManager *sManager = [SpeechManager shareSpeech];
        [sManager speech:_keyword];
    } andImageData:UIImageJPEGRepresentation(image, 0.1)];
    

}


@end
