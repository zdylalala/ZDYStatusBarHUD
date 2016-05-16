//
//  ViewController.m
//  ZDYStatusBarHUDExamples
//
//  Created by 周点兵 on 16/5/16.
//  Copyright © 2016年 周点兵. All rights reserved.
//

#import "ViewController.h"
#import "ZDYStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)success:(id)sender {
    [ZDYStatusBarHUD showSuccess:@"成功啦啦啦"];
}

- (IBAction)error:(id)sender {
    [ZDYStatusBarHUD showError:@"失败啦啦啦"];
}
- (IBAction)load:(id)sender {
    [ZDYStatusBarHUD showLoading:@"正在加载中"];
}

- (IBAction)hide:(id)sender {
    [ZDYStatusBarHUD hide];
}
- (IBAction)normalText:(id)sender {
    [ZDYStatusBarHUD showMessage:@"哈哈哈"];
}

@end
