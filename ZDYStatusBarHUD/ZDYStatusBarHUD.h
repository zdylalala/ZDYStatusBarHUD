//
//  ZDYStatusBarHUD.h
//  ZDYStatusBarHUDExamples
//
//  Created by 周点兵 on 16/5/16.
//  Copyright © 2016年 周点兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDYStatusBarHUD : NSObject
/**
 *  显示一一般信息，带图片
 *
 *  @param message 要显示的信息
 *  @param image   要显示的图片(大小自己控制)
 */
+(void)showMessage:(NSString*)message withImage:(UIImage*)image;
/**
 * 显示普通的信息，不带图片
 */
+(void)showMessage:(NSString*)message;
/**
 *  显示成功信息
 *
 *  @param message 成功的文字(图片由框架提供)
 */
+(void)showSuccess:(NSString*)message;
/**
 *  显示失败的信息
 *
 *  @param message 失败的文字(图片由框架提供)
 */
+(void)showError:(NSString*)message;

/**
 *  显示正在处理的信息
 *
 *  @param message 显示的文字
 */
+(void)showLoading:(NSString*)message;
/**
 *  隐藏
 */
+(void)hide;


@end
