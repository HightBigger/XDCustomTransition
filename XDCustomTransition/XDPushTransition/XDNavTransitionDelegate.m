//
//  XDNavTransitionDelegate.m
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/21.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDNavTransitionDelegate.h"
#import "XDSNavTransition.h"

@implementation XDNavTransitionDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [XDSNavTransition new];
}

@end
