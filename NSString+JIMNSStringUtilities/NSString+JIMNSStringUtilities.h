//
//  NSString+JIMNSStringUtilities.h
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 4/23/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JIMNSStringUtilities)

extern const int kJIMNSStringUtilitiesRandomStringCapacity;

+ (NSString *)jim_UUID;
+ (NSString *)jim_generateRandomString;
+ (NSString *)jim_generateRandomString:(int)capacity;

@end
