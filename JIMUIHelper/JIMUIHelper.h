//
//  JIMUIHelper.h
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 7/19/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IS_WIDESCREEN (fabs((double) [[UIScreen mainScreen] bounds].size.height - (double) 568) < DBL_EPSILON)
#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
#define IS_IPHONE_5 (IS_IPHONE && IS_WIDESCREEN)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface JIMUIHelper : NSObject

extern const int kJIMUIHelperAddLabelOnTopLabelTag;

+ (void)addLabelOnTop:(UIView *)view withText:(NSString *)text;
+ (void)removeLabelOnTop:(UIView *)view;
+ (void)addLoadingBlockLabel:(UIViewController *)viewController;
+ (void)removeLoadingBlockLabel:(UIViewController *)viewController;

@end
