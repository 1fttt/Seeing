//
//  NSString+NSString_md5.m
//  Seeing
//
//  Created by 房彤 on 2021/3/8.
//  Copyright © 2021 房彤. All rights reserved.
//

#import "NSString+NSString_md5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (NSString_md5)

- (NSString *)md5String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}

@end
