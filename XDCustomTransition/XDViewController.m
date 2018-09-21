//
//  XDViewController.m
//  XDCustomTransition
//
//  Created by chenyixing on 2018/9/20.
//  Copyright © 2018年 nationsky. All rights reserved.
//

#import "XDViewController.h"
#import "XDWeChatManager.h"


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

@end
