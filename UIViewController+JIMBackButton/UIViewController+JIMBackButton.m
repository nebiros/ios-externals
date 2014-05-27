//
//  UIViewController+JIMBackButton.m
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 11/7/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import "UIViewController+JIMBackButton.h"

@implementation UIViewController (JIMBackButton)

- (void)jim_setupCustomBackButton
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    
    if ([self.navigationController.viewControllers count] <= 0) {
        return;
    }
    
    if ([self.navigationController.visibleViewController isEqual:self.navigationController.viewControllers[0]]) {
        return;
    }

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backButtonImage = [UIImage imageNamed:@"back_button_white"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(jim_customBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 0, backButtonImage.size.width, backButtonImage.size.height);
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

- (IBAction)jim_customBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
