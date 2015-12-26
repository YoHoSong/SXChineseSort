//
//  NSString+Chinese.m
//  slh_new
//
//  Created by songx on 15/12/11.
//  Copyright © 2015年 dlsoft. All rights reserved.
//

#import "NSString+Chinese.h"

@implementation NSString (Chinese)

- (NSString *)pinYinString {
    
    if (self == nil) {
        return nil;
    }
    
    NSMutableString *pinYin = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)pinYin, NULL, kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)pinYin, NULL, kCFStringTransformStripDiacritics, false);
    
    return pinYin;
}
@end
