//
//  XDWeChatTransition.h
//  AppNest
//
//  Created by xiaoda on 2018/8/6.
//  Copyright © 2018年 xiaoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define animateDuration 0.3f

/** 进场或离场的动画类型 */
typedef enum : NSUInteger {
    TransitionBeginAndEnd, //会议开始或结束的方式
    TransitionMinAndMax    //会议最大或最小化的方式
} XDWeChatTransitionType;

@interface XDWeChatTransition : NSObject<UIViewControllerAnimatedTransitioning>

/** type of transition*/
@property (nonatomic ,assign) XDWeChatTransitionType transitionType;

@property (nonatomic,assign) CGRect lastFrame;

+ (instancetype)transitionWithTransitionType:(XDWeChatTransitionType)transitionType
                                   lastFrame:(CGRect)lastFrame;

@end
