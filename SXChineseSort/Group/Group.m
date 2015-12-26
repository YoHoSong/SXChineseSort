//
//  Group.m
//  SXChineseSort
//
//  Created by 20090909 on 15/12/15.
//  Copyright © 2015年 Mocha. All rights reserved.
//

#import "Group.h"
#import "NSString+Chinese.h"
#import "NSArray+SortChinese.h"
@implementation Group

+ (NSMutableArray *)groupArray:(NSArray *)array groupKey:(NSString *)key{
    array = [[array sortedWithChineseKey:key]mutableCopy];
    NSMutableArray *dataArray = [NSMutableArray array];
    //创建包含A-Z的字符串数组
    NSMutableArray *wordArray = [NSMutableArray array];
    NSString *charString;
    for (char c = 65 ;c<91 ; c++) {
        charString = [NSString stringWithFormat:@"%c",c];
        [wordArray addObject:charString];
    }
    [wordArray addObject:@"#"];
    
    //依据字符串数组创建字典，且字典的key就是A-Z，Value均为可变数组，然后把所有字典放到容器数组中
    for (int i = 0; i<wordArray.count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:[NSMutableArray array] forKey:wordArray[i]];
        [dataArray addObject:dic];
    }
    //对数据进行分组
    NSString *word = @"^[a-zA-Z]+$";
    NSPredicate *wordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",word];
    
    for (int i = 0; i<array.count; i++) {
        NSString *groupString = (key == nil) ? array[i] : [array[i] valueForKeyPath:key];
        NSString *namePinYin = [groupString.pinYinString stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([wordPredicate evaluateWithObject:namePinYin]) {
            for (int i = 0; i<wordArray.count; i++) {
                charString = wordArray[i];
                if ([namePinYin hasPrefix:charString]||[namePinYin hasPrefix:charString.lowercaseString]) {
                    [dataArray[i][charString] addObject:groupString];
                }
            }
        }else{
            [[dataArray lastObject][@"#"] addObject:groupString];
        }
    }
    NSMutableArray *data = [NSMutableArray array];
    NSMutableArray *keyWords = [NSMutableArray array];
    //分组完成后，将数组为空的字典从大数组中去掉，获得表头、索引数组以及最终分组
    
    for (int i = 0; i<wordArray.count; i++) {
        NSString *charString = wordArray[i];
        NSArray *array = dataArray[i][charString];
        if ( array.count !=0) {
            [data addObject:array];
            [keyWords addObject:charString];
        }
    }
    return dataArray;
}

@end
