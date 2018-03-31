//
//  AllStatusController.m
//  QQZone
//
//  Created by developershang on 2017/4/22.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "AllStatusController.h"

@interface AllStatusController ()

@end

@implementation AllStatusController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //1.设置背景色
    self.view.backgroundColor = [UIColor cyanColor];
    // 2.设置titleView
    NSArray *items = @[@"全部", @"特别关心", @"好友动态", @"认证空间"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:items];
    sc.tintColor = [UIColor lightGrayColor];
    sc.selectedSegmentIndex = 0;
    [sc setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    self.navigationItem.titleView = sc;
    
    //3. 监听事件的点击
    [sc addTarget:self action:@selector(segementClick:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)segementClick:(UISegmentedControl*)segement{
    
    NSLog(@"cick %ld",segement.selectedSegmentIndex);
}

@end
