//
//  XDWeChatViewController.h
//  XDCustomTransition
//
//  Created by xiaoda on 2018/9/20.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDWeChatViewController : UIViewController

@property (nonatomic, copy) void (^disMissBtnBlock)(void);

@property (nonatomic, copy) void (^miniMizeBlock)(void);

@end

