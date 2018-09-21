//
//  XDUtil.m
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/20.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDUtil.h"

@implementation XDUtil

+ (UIViewController *)findTopViewController
{
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    
    return [self getCurrentViewControllerWithViewController:currentWindow.rootViewController];
}


+ (UIViewController *)getCurrentViewControllerWithViewController:(UIViewController *)viewController
{
    UIViewController *currentVC = viewController;
    BOOL flag = NO;
    if ([currentVC isKindOfClass:[UITabBarController class]])
    {
        flag = YES;
        currentVC = [(UITabBarController *)currentVC selectedViewController];
    }
    else if ([currentVC isKindOfClass:[UINavigationController class]])
    {
        flag = YES;
        currentVC = [(UINavigationController *)currentVC visibleViewController];
    }
    else if (currentVC.presentedViewController)
    {
        flag = YES;
        currentVC = currentVC.presentedViewController;
    }
    if (flag)
    {
        return [self getCurrentViewControllerWithViewController:currentVC];
    }
    
    return currentVC;
}

@end
