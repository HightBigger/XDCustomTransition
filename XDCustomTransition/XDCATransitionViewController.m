//
//  XDCATransitionViewController.m
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/21.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import "XDCATransitionViewController.h"

@interface XDCATransitionViewController ()

@end

@implementation XDCATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    
    [btn setTitle:@"pop" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(didClickPopBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)didClickPopBtn:(UIButton *)sender
{
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionReveal;//根据需求自己设置
    transition.subtype = kCATransitionFromBottom;//根据需求自己设置
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];//这里传NO，不然两个动画会叠加
    
}

@end
