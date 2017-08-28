//
//  FTInteractiveTransition.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "FTInteractiveTransition.h"

@implementation FTInteractiveTransition

- (FTPresentAnimator *)presentAnimator
{
    if (!_presentAnimator) {
        _presentAnimator = [[FTPresentAnimator alloc] init];
    }
    return _presentAnimator;
}

- (FTDismissAnimator *)dismissAnimator
{
    if (!_dismissAnimator) {
        _dismissAnimator = [[FTDismissAnimator alloc] init];
    }
    return _dismissAnimator;
}

- (FTInteractiveAnimator *)interactiveAnimator
{
    if (!_interactiveAnimator) {
        _interactiveAnimator = [[FTInteractiveAnimator alloc] init];
    }
    return _interactiveAnimator;
}

- (void)wireEdgePanGestureToViewController:(UIViewController *)viewController
{
    [self.interactiveAnimator wireEdgePanGestureToViewController:viewController];
}

- (void)wirePanGestureToUIView:(UIView *)view forViewController:(UIViewController *)viewController
{
    [self.interactiveAnimator wirePanGestureToUIView:view forViewController:viewController];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.dismissAnimator.direction = self.interactiveAnimator.interactionInProgress ? self.interactiveAnimator.direction : FTDismissAnimatorDirectionVertical;
    return self.dismissAnimator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactiveAnimator.interactionInProgress ? self.interactiveAnimator : nil;
}

@end
