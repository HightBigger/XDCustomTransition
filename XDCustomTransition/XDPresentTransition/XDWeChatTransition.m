//
//  XDWeChatTransition.m
//  AppNest
//
//  Created by xiaoda on 2018/8/6.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDWeChatTransition.h"

@interface XDWeChatTransition ()

@end

@implementation XDWeChatTransition

+ (instancetype)transitionWithTransitionType:(XDWeChatTransitionType)transitionType
                                   lastFrame:(CGRect)lastFrame
{
    XDWeChatTransition *transiton = [[XDWeChatTransition alloc]init];
    
    transiton.transitionType = transitionType;
    transiton.lastFrame = lastFrame;
    
    return transiton;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return animateDuration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    
    [containerView addSubview:toView];
    
    if (toVC.isBeingPresented)
    {
        [[transitionContext containerView] bringSubviewToFront:toView];
        
        if (self.transitionType == TransitionBeginAndEnd)
            [self presentVC:toView fromVC:fromView transitionContext:transitionContext];
        else
            [self maximizeVC:toView fromVC:fromView transitionContext:transitionContext];
    }
    
    if (fromVC.isBeingDismissed)
    {
        [[transitionContext containerView] bringSubviewToFront:fromView];
        
        if (self.transitionType == TransitionBeginAndEnd)
            [self dissMissVC:toView fromVC:fromView transitionContext:transitionContext];
        else
            [self minimizeVC:toView fromVC:fromView transitionContext:transitionContext];
    }
}

- (void)presentVC:(UIView *)toView fromVC:(UIView *)fromView transitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    CGRect oldFrame = toView.layer.frame;
    
    toView.layer.frame = CGRectMake(0, -CGRectGetHeight(oldFrame), CGRectGetWidth(oldFrame), CGRectGetHeight(oldFrame));
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        toView.layer.frame = oldFrame;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}

- (void)dissMissVC:(UIView *)toView fromVC:(UIView *)fromView transitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    CGRect oldFrame = fromView.layer.frame;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        fromView.layer.frame = CGRectMake(0, -CGRectGetHeight(oldFrame), CGRectGetWidth(oldFrame), CGRectGetHeight(oldFrame));
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}

- (void)minimizeVC:(UIView *)toView fromVC:(UIView *)fromView transitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        fromView.layer.frame = self.lastFrame;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}

- (void)maximizeVC:(UIView *)toView fromVC:(UIView *)fromView transitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
    CGRect oldFrame = fromView.frame;
    
    toView.layer.frame = self.lastFrame;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        toView.layer.frame = oldFrame;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}


@end
