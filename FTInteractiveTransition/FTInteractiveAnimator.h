//
//  FTInteractiveAnimator.h
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTITMarcos.h"

@interface FTInteractiveAnimator : UIPercentDrivenInteractiveTransition <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) UIView *view;
@property (nonatomic, assign) BOOL shouldCompleteTransition;
@property (nonatomic, assign) BOOL interactionInProgress;
@property (nonatomic, assign) FTDismissAnimatorDirection direction;

- (void)wireEdgePanGestureToViewController:(UIViewController *)viewController;

- (void)wirePanGestureToUIView:(UIView *)view forViewController:(UIViewController *)viewController;

@end
