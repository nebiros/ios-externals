//
//  JIMUIHelper.m
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/19/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import "JIMUIHelper.h"

@implementation JIMUIHelper

const int kJIMUIHelperAddLabelOnTopLabelTag = 10800;

+ (void)addLabelOnTop:(UIView *)superview withText:(NSString *)text
{
    UIView *blockUi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, superview.bounds.size.width, superview.bounds.size.height)];
    blockUi.backgroundColor = [UIColor whiteColor];
    blockUi.tag = kJIMUIHelperAddLabelOnTopLabelTag;
    blockUi.layer.zPosition = 1000;
    
    // derive the center x and y.
    float centerX = blockUi.frame.size.width / 2;
    float centerY = blockUi.frame.size.height / 2;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = text;
    label.font = [UIFont systemFontOfSize:17.f];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    
    CGSize labelSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(blockUi.frame.size.width, CGFLOAT_MAX) lineBreakMode:label.lineBreakMode];
    
    label.frame = CGRectMake(centerX - (labelSize.width/ 2), centerY - (labelSize.height / 2), labelSize.width, labelSize.height);
    label.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin);
    [blockUi addSubview:label];
    
    [superview insertSubview:blockUi atIndex:[superview.subviews count]];
    [superview bringSubviewToFront:blockUi];
}

+ (void)removeLabelOnTop:(UIView *)view
{
    UILabel *label = (UILabel *) [view viewWithTag:kJIMUIHelperAddLabelOnTopLabelTag];
    label.alpha = 0.f;
    [label removeFromSuperview];
}

+ (void)addLoadingBlockLabel:(UIViewController *)viewController
{
    [self addLabelOnTop:viewController.view withText:NSLocalizedString(@"Loading...", nil)];
}

+ (void)removeLoadingBlockLabel:(UIViewController *)viewController
{
    [self removeLabelOnTop:viewController.view];
}

@end
