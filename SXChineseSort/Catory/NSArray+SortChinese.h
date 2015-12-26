//
//  NSArray+SortChinese.h
//  slh_new
//
//  Created by songx on 15/12/11.
//  Copyright © 2015年 dlsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SortChinese)
/*通过对象的某个的key值对数组内的对象进行排序
 *不传chineseKey，表示数组内全是字符串
 */
- (NSArray *)sortedWithChineseKey:(NSString *)chineseKey;

@end
