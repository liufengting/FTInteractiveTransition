//
//  FTInteractiveTransition.h
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTPresentAnimator.h"
#import "FTDismissAnimator.h"
#import "FTInteractiveAnimator.h"

@interface FTInteractiveTransition : NSObject <UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) FTPresentAnimator *presentAnimator;
@property (nonatomic, strong) FTDismissAnimator *dismissAnimator;
@property (nonatomic, strong) FTInteractiveAnimator *interactiveAnimator;

- (void)wireEdgePanGestureToViewController:(UIViewController *)viewController;

- (void)wirePanGestureToUIView:(UIView *)view forViewController:(UIViewController *)viewController;

@end
