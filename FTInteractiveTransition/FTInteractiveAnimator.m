//
//  FTInteractiveAnimator.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "FTInteractiveAnimator.h"

@implementation FTInteractiveAnimator

- (void)wireEdgePanGestureToViewController:(UIViewController *)viewController
{
    self.viewController = viewController;
    [self prepareEdgePanGestureRecognizerInView:viewController.view];
}

- (void)prepareEdgePanGestureRecognizerInView:(UIView *)view
{
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleEdgePanGesture:)];
    gesture.edges = UIRectEdgeLeft;
    gesture.delegate = self;
    [view addGestureRecognizer:gesture];
}

- (void)wirePanGestureToUIView:(UIView *)view forViewController:(UIViewController *)viewController;
{
    self.view = view;
    self.viewController = viewController;
    [self preparePanGestureRecognizerInView:view];
}

- (void)preparePanGestureRecognizerInView:(UIView *)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleEdgePanGesture:)];
    gesture.delegate = self;
    [view addGestureRecognizer:gesture];
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    void (^block)(FTDismissAnimatorDirection direction) = ^(FTDismissAnimatorDirection direction){
        self.direction = direction;
        self.interactionInProgress = YES;
        [self.viewController dismissViewControllerAnimated:YES completion:NULL];
    };

    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        block(FTDismissAnimatorDirectionHorizontal);
        return YES;
    }else{
        if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            CGPoint translatedPoint = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:gestureRecognizer.view];
            if (translatedPoint.x > 0 && fabs(translatedPoint.x) > fabs(translatedPoint.y)) {
                block(FTDismissAnimatorDirectionHorizontal);
                return YES;
            }else if (translatedPoint.y > 0) {
                if ([self.view isKindOfClass:[UIScrollView class]]) {
                    if (((UIScrollView *)self.view).contentOffset.y <= 0) {
                        block(FTDismissAnimatorDirectionVertical);
                        return YES;
                    }
                }else{
                    block(FTDismissAnimatorDirectionVertical);
                    return YES;
                }
            }
        }
    }
    return NO;
}

#pragma mark - handleEdgePanGesture

- (void)handleEdgePanGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    CGFloat progress = 0;
    if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        progress = translation.x / [UIScreen mainScreen].bounds.size.width;
    }else{
        if (self.direction == FTDismissAnimatorDirectionHorizontal) {
            progress = translation.x / [UIScreen mainScreen].bounds.size.width;
        }else{
            progress = translation.y / [UIScreen mainScreen].bounds.size.height;
        }
    }

    progress = MIN(fabs(progress), 1.0);

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.interactionInProgress = YES;
            break;
        case UIGestureRecognizerStateChanged:
            self.shouldCompleteTransition = (progress >= FTInteractiveAnimatorMinPercent);
            [self updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
            self.interactionInProgress = NO;
            [self cancelInteractiveTransition];
            break;
        case UIGestureRecognizerStateEnded:
            self.interactionInProgress = NO;
            if (self.shouldCompleteTransition) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            break;
        default:
            break;
    }
}

@end
