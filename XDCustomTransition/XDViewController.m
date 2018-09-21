//
//  XDViewController.m
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/20.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDViewController.h"
#import "XDWeChatManager.h"
#import "XDCATransitionViewController.h"
#import "XDNavTransitionDelegate.h"
#import "XDNavTransitionViewController.h"

@interface XDViewController ()
@property (weak, nonatomic) IBOutlet UIButton *WeChatBtn;

@property (nonatomic,strong) XDNavTransitionDelegate *transitionDelagate;

@end

@implementation XDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitionDelagate = [XDNavTransitionDelegate new];
    
}

- (IBAction)didClickWeChatBtn:(UIButton *)sender
{
    [[XDWeChatManager shareIntance] showWeChatViewChat];
}

- (IBAction)didClickPushBtn:(UIButton *)sender
{
    XDCATransitionViewController *vc= [[XDCATransitionViewController alloc] init];
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;//根据需求自己设置
    transition.subtype = kCATransitionFromTop;//根据需求自己设置
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:vc animated:NO];//这里传NO，不然两个动画会叠加
}

- (IBAction)didClickDrawerBtn:(UIButton *)sender
{
    
    XDNavTransitionViewController *vc = [XDNavTransitionViewController new];
    
    self.navigationController.delegate = self.transitionDelagate;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
