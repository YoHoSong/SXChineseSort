//
//  ViewController.m
//  SXChineseSort
//
//  Created by 20090909 on 15/12/15.
//  Copyright © 2015年 Mocha. All rights reserved.
//

#import "ViewController.h"
#import "Group.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *a = [NSArray arrayWithObjects:@"日期",@"人生",@"仿佛",@"佛陀",@"萨满",@"太阿",@"太阳",@"月球",@"地球", nil];
    NSDictionary *dic1 = @{@"name":@"qo",@"age":@"ww",@"height":@"ewew"};
    NSDictionary *dic2 = @{@"name":@"fo",@"age":@"ww",@"height":@"ewew"};
    NSDictionary *dic3 = @{@"name":@"go",@"age":@"ww",@"height":@"ewew"};
    NSDictionary *dic4 = @{@"name":@"5o",@"age":@"ww",@"height":@"ewew"};
    NSDictionary *dic5 = @{@"name":@"ho",@"age":@"ww",@"height":@"ewew"};
    NSMutableArray *b = [NSMutableArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
    [Group groupArray:b groupKey:@"name"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
