//
//  XDPushHeadViewController.m
//  XDCustomTransition
//
//  Created by chenyixing on 2018/9/21.
//  Copyright © 2018年 nationsky. All rights reserved.
//

#import "XDPushHeadViewController.h"

@interface XDPushHeadViewController ()

@end

@implementation XDPushHeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    
    [btn setTitle:@"pop" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(didClickPopBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)didClickPopBtn:(UIButton *)sender
{
    //设置出场方向(从下方推出去)
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];
    
}

@end
