//
//  FTDismissAnimator.h
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTITMarcos.h"

@interface FTDismissAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) FTDismissAnimatorDirection direction;

@end
