//
//  XDWeChatViewController.m
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/20.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDWeChatViewController.h"

@interface XDWeChatViewController ()

@end

@implementation XDWeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor grayColor]];
    
}

- (IBAction)miniMizeAction:(UIButton *)sender
{
    if (self.miniMizeBlock)
    {
        self.miniMizeBlock();
    }

}

- (IBAction)disMissAction:(UIButton *)sender
{
    if (self.disMissBtnBlock)
    {
        self.disMissBtnBlock();
    }
}

@end
