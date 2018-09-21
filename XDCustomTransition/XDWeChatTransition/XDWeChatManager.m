//
//  XDWeChatManager.m
//  XDCustomTransition
//
//  Created by chenyixing on 2018/9/20.
//  Copyright © 2018年 nationsky. All rights reserved.
//

#import "XDWeChatManager.h"
#import "XDUtil.h"
#import "XDWeChatTransition.h"
#import "XDWeChatViewController.h"

#define XDScreenW [UIScreen mainScreen].bounds.size.width
#define XDScreenH [UIScreen mainScreen].bounds.size.height

@interface XDWeChatManager ()<UIViewControllerTransitioningDelegate>

@property (nonatomic,assign) XDWeChatTransitionType transitionType;

@property (nonatomic,strong) XDWeChatViewController *weChatVC;

@property (nonatomic,assign) BOOL isFullscreen;

@property (nonatomic,assign) CGRect lastSmallFrame;

@property (nonatomic,strong) UIView *smallWindow;

@property (nonatomic,strong) UITapGestureRecognizer *tapMaximizeGes;

@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@end

@implementation XDWeChatManager

+ (XDWeChatManager *)shareIntance
{
    static XDWeChatManager* shareIntance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareIntance = [[XDWeChatManager alloc] init];
    });
    return shareIntance;
}

- (void)showWeChatViewChat
{
    __weak typeof(self) weakSelf = self;
    if (!_weChatVC)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _weChatVC = [storyboard instantiateViewControllerWithIdentifier:@"WeChat"];
        
        CGFloat smallWindowW = 60;
        CGFloat smallWindowH = 80;
        _lastSmallFrame = CGRectMake(XDScreenW - smallWindowW-5, (XDScreenH - smallWindowH)/2-5, smallWindowW, smallWindowH);
        
        [_weChatVC setMiniMizeBlock:^{
            
            [weakSelf disMissMeetingVCWithTransitionType:TransitionMinAndMax completion:^{
                
                [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.smallWindow];
                
            }];
        }];

        [_weChatVC setDisMissBtnBlock:^{
            
            [weakSelf disMissMeetingVCWithTransitionType:TransitionBeginAndEnd completion:^{
                weakSelf.weChatVC = nil;
            }];
            
        }];
        
        [self presentMeetingVCWithTransitionType:TransitionBeginAndEnd completion:nil];
    }
    else
    {
        [self presentMeetingVCWithTransitionType:TransitionMinAndMax completion:^{
            
            [weakSelf.smallWindow removeFromSuperview];
            
        }];
    }
}

- (void)weChatViewMaximize
{
    [self presentMeetingVCWithTransitionType:TransitionMinAndMax completion:nil];
}

- (void)panMeetingView:(UIPanGestureRecognizer *)panGesture
{
    CGPoint point = [panGesture locationInView:[UIApplication sharedApplication].delegate.window];
    CGFloat distance = 5;//边距
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        
        CGRect frame = self.smallWindow.frame;
        if (frame.origin.y <= distance) {
            
            point.y = distance+frame.size.height/2;
            
        }else if (frame.origin.y >= XDScreenH - frame.size.height -distance){
            
            point.y = XDScreenH - distance-frame.size.height/2 - distance;
        }
        
        if (frame.origin.x <= XDScreenW/2.0) {
            
            point.x = distance+frame.size.width/2;
            
        }else {
            
            point.x = XDScreenW - distance-frame.size.width/2;
        }
        
        [UIView animateWithDuration:animateDuration animations:^{
            self.smallWindow.center = point;
        } completion:^(BOOL finished) {
            self.lastSmallFrame = self.smallWindow.frame;
        }];
        
    }else {
        self.smallWindow.center = point;
    }
}


- (void)presentMeetingVCWithTransitionType:(XDWeChatTransitionType)transitionType completion:(void (^)(void))completion
{
    self.transitionType = transitionType;
    
    _weChatVC.transitioningDelegate = self;
    
    [[XDUtil findTopViewController] presentViewController:_weChatVC animated:YES completion:^{
        self.isFullscreen = YES;
        
        if (completion)
            completion();
        
    }];
}


- (void)disMissMeetingVCWithTransitionType:(XDWeChatTransitionType)transitionType completion:(void (^)(void))completion
{
    self.transitionType = transitionType;
    
    _weChatVC.transitioningDelegate = self;
    
    [_weChatVC dismissViewControllerAnimated:YES completion:^{
        self.isFullscreen = NO;
        
        if (completion)
            completion();
    }];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [XDWeChatTransition transitionWithTransitionType:self.transitionType lastFrame:self.lastSmallFrame];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [XDWeChatTransition transitionWithTransitionType:self.transitionType lastFrame:self.lastSmallFrame];
}


- (UIView *)smallWindow
{
    if (!_smallWindow)
    {
        _smallWindow = [[UIView alloc]initWithFrame:self.lastSmallFrame];
        [_smallWindow addGestureRecognizer:self.tapMaximizeGes];
        [_smallWindow addGestureRecognizer:self.panGesture];
        _smallWindow.backgroundColor = [UIColor grayColor];
    }
    
    return _smallWindow;
}

- (UITapGestureRecognizer *)tapMaximizeGes
{
    if (!_tapMaximizeGes)
    {
        _tapMaximizeGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(weChatViewMaximize)];
    }
    return _tapMaximizeGes;
}

- (UIPanGestureRecognizer *)panGesture
{
    if (!_panGesture)
    {
        _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMeetingView:)];
    }
    return _panGesture;
}

@end
