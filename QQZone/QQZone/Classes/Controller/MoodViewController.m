//
//  MoodViewController.m
//  QQZone
//
//  Created by developershang on 2017/4/21.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "MoodViewController.h"

@interface MoodViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MoodViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //1. 设置背景色
    self.view.backgroundColor = [UIColor yellowColor];
    
    //2. 设置导航栏
    self.title = @"发表心情";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(exit)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self addTableView];
}

- (void)exit{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)addTableView{
    
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.backgroundColor = [UIColor greenColor];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hello"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hello"];
    }
    
    cell.textLabel.text  = [NSString stringWithFormat:@"测试数据%ld",(long)indexPath.row];
    return cell;
 
}


@end
