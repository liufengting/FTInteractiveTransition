//
//  ViewController.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/28.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "FTInteractiveTransition.h"

@interface ViewController ()

@property (nonatomic, strong) FTInteractiveTransition *interactiveTransition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.supportPanDismiss) {
        FTInteractiveTransition *it = (FTInteractiveTransition *)self.navigationController.transitioningDelegate;
        [it wirePanGestureToUIView:self.view forViewController:self.navigationController];
    }
}

- (FTInteractiveTransition *)interactiveTransition
{
    if (!_interactiveTransition) {
        _interactiveTransition = [[FTInteractiveTransition alloc] init];
    }
    return _interactiveTransition;
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender
{
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    VC.supportPanDismiss = YES;


    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    nav.transitioningDelegate = self.interactiveTransition;
    [self presentViewController:nav animated:YES completion:NULL];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detailVC];
    nav.transitioningDelegate = self.interactiveTransition;
    [self presentViewController:nav animated:YES completion:NULL];
}

@end
