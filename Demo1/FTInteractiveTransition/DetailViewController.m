//
//  DetailViewController.m
//  FTInteractiveTransition
//
//  Created by LiuFengting on 2017/8/29.
//  Copyright © 2017年 LiuFengting. All rights reserved.
//

#import "DetailViewController.h"
#import "FTInteractiveTransition.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FTInteractiveTransition *it = (FTInteractiveTransition *)self.navigationController.transitioningDelegate;
    [it wirePanGestureToUIView:self.tableView forViewController:self.navigationController];
}

- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

@end
