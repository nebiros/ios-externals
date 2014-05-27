//
//  NSString+JIMNSStringUtilities.m
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 4/23/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import "NSString+JIMNSStringUtilities.h"

@implementation NSString (JIMNSStringUtilities)

const int kJIMNSStringUtilitiesRandomStringCapacity = 20;

+ (NSString *)jim_UUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    NSString *uuidString = (__bridge_transfer NSString *) CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return uuidString;
}

+ (NSString *)jim_generateRandomString
{
    return [self jim_generateRandomString:kJIMNSStringUtilitiesRandomStringCapacity];
}

+ (NSString *)jim_generateRandomString:(int)capacity
{
    NSMutableString* string = [NSMutableString stringWithCapacity:capacity];
    for (int i = 0; i < capacity; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

@end
