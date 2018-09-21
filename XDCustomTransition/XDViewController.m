//
//  XDViewController.m
//  XDCustomTransition
//
//  Created by chenyixing on 2018/9/20.
//  Copyright © 2018年 nationsky. All rights reserved.
//

#import "XDViewController.h"
#import "XDWeChatManager.h"
#import "XDPushHeadViewController.h"

@interface XDViewController ()
@property (weak, nonatomic) IBOutlet UIButton *WeChatBtn;

@end

@implementation XDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)didClickWeChatBtn:(UIButton *)sender
{
    [[XDWeChatManager shareIntance] showWeChatViewChat];
}

- (IBAction)didClickPushBtn:(UIButton *)sender
{
    
    XDPushHeadViewController *vc= [[XDPushHeadViewController alloc] init];
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;//根据需求自己设置
    transition.subtype = kCATransitionFromTop;//根据需求自己设置
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:vc animated:NO];//这里传NO，不然两个动画会叠加
}
@end
