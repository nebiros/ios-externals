//
//  NSString+JIMNSStringUtilities.m
//  juan.im
//
//  Created by Juan Felipe Alvarez Saldarriaga on 4/23/13.
//  Copyright (c) 2013 juan.im. All rights reserved.
//

#import "NSString+JIMNSStringUtilities.h"

#import <CommonCrypto/CommonDigest.h>

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

- (NSString *)jim_MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return output;
}

@end
