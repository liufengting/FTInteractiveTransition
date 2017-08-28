//
//  FTPresentAnimator.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "FTPresentAnimator.h"
#import "FTITMarcos.h"

@implementation FTPresentAnimator

- (NSTimeInterval)duration
{
    return _duration > 0 ? _duration : FTPresentAnimatorDefaultAnimationDuration;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    [transitionContext.containerView addSubview:toVC.view];

    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0
                                                          relativeDuration:1.0
                                                                animations:^{
                                                                    fromVC.view.layer.transform = CATransform3DMakeScale(FTITDefaultZoomScale , FTITDefaultZoomScale, 1);
                                                                    toVC.view.frame = [UIScreen mainScreen].bounds;
                                                                }];

                              }
                              completion:^(BOOL finished) {
                                  [transitionContext completeTransition:(!transitionContext.transitionWasCancelled)];
                              }];
}

@end
