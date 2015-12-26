//
//  NSArray+SortChinese.m
//  slh_new
//
//  Created by songx on 15/12/11.
//  Copyright © 2015年 dlsoft. All rights reserved.
//

#import "NSArray+SortChinese.h"
#import "NSString+Chinese.h"
@implementation NSArray (SortChinese)

- (NSArray *)sortedWithChineseKey:(NSString *)chineseKey {
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (int i = 0; i < self.count; ++i) {
        NSString *chineseString = (chineseKey == nil) ? self[i] : [self[i] valueForKeyPath:chineseKey];
        [tmpArray addObject:@{@"obj": self[i], @"pinyin": chineseString.pinYinString.lowercaseString}];
    }
    
    [tmpArray sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        return [obj1[@"pinyin"] compare:obj2[@"pinyin"]];
    }];
    
    return [tmpArray valueForKey:@"obj"];;
}

@end
