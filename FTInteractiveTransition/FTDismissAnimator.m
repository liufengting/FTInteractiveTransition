//
//  FTDismissAnimator.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "FTDismissAnimator.h"

@implementation FTDismissAnimator

- (NSTimeInterval)duration
{
    return _duration > 0 ? _duration : FTDismissAnimatorDefaultAnimationDuration;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [transitionContext.containerView addSubview:toVC.view];
    [transitionContext.containerView bringSubviewToFront:fromVC.view];

    CGRect rect = CGRectZero;
    if (self.direction == FTDismissAnimatorDirectionHorizontal) {
        rect = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }else{
        rect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }

    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0
                                                          relativeDuration:1.0
                                                                animations:^{

                                                                    fromVC.view.frame = rect;
                                                                    toVC.view.layer.transform = CATransform3DMakeScale(1 , 1, 1);
                                                                }];

                              }
                              completion:^(BOOL finished) {
                                  [transitionContext completeTransition:(!transitionContext.transitionWasCancelled)];
                              }];
    
    
}

@end
