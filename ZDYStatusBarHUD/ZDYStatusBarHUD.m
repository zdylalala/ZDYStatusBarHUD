//
//  ZDYStatusBarHUD.m
//  ZDYStatusBarHUDExamples
//
//  Created by 周点兵 on 16/5/16.
//  Copyright © 2016年 周点兵. All rights reserved.
//

#import "ZDYStatusBarHUD.h"

@implementation ZDYStatusBarHUD
//全局窗口
static UIWindow* window_ ;
//全局定时器
static NSTimer *timer_;

/**
 *  显示窗口(框架内部自己使用)
 */
+(void)showWindow{
    //防止window残留
    window_.hidden=YES;
    window_=[[UIWindow alloc]init];
    window_.backgroundColor=[UIColor blackColor];
    //设置窗口的优先级,覆盖在最上面
    window_.windowLevel=UIWindowLevelAlert;
    window_.frame=CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden=NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        window_.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 );
    
    }];
    
    NSLog(@"aaa");
    
    
}




/**
 *  显示一一般信息，带图片
 *
 *  @param message 要显示的信息
 *  @param image   要显示的图片(大小自己控制)
 */
+(void)showMessage:(NSString*)message withImage:(UIImage*)image{
    //显示窗口
    [ZDYStatusBarHUD showWindow];
    
    [timer_ invalidate];
    
    //显示button
    UIButton* button =[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:message forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:12];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets=UIEdgeInsetsMake(0, 15, 0, 0);
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame=window_.frame;
    [window_ addSubview:button];
    
    timer_ =[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
/**
 * 显示普通的信息，不带图片
 */
+(void)showMessage:(NSString*)message{
    [ZDYStatusBarHUD showMessage:message withImage:nil];

}
/**
 *  显示成功信息
 *
 *  @param message 成功的文字(图片由框架提供)
 */
+(void)showSuccess:(NSString*)message{
    [ZDYStatusBarHUD showMessage:message withImage:[UIImage imageNamed:@"ZDYStatusBarHUD.bundle/success"]];

}
/**
 *  显示失败的信息
 *
 *  @param message 失败的文字(图片由框架提供)
 */
+(void)showError:(NSString*)message{
    [ZDYStatusBarHUD showMessage:message withImage:[UIImage imageNamed:@"ZDYStatusBarHUD.bundle/error"]];

}

/**
 *  显示正在处理的信息
 *
 *  @param message 显示的文字
 */
+(void)showLoading:(NSString*)message{
    [timer_ invalidate];
    timer_=nil;
    //先加窗口
    [ZDYStatusBarHUD showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];

    //添加旋转的圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    CGFloat msgW = [message sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}
/**
 *  隐藏
 */
+(void)hide{
    
    [UIView animateWithDuration:0.25 animations:^{
        window_.frame=CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
    } completion:^(BOOL finished) {
        window_.hidden=YES;
        window_=nil;
        timer_=nil;
    }];
    
    


}
@end
