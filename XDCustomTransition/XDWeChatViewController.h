//
//  XDWeChatViewController.h
//  XDCustomTransition
//
//  Created by chenyixing on 2018/9/20.
//  Copyright © 2018年 nationsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDWeChatViewController : UIViewController

@property (nonatomic, copy) void (^disMissBtnBlock)(void);

@property (nonatomic, copy) void (^miniMizeBlock)(void);

@end

