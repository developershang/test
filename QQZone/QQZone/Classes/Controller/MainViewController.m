//
//  MainViewController.m
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "MainViewController.h"
#import "Dock.h"
#import "MoodViewController.h"

#import "IconButton.h"
#import "Tabbar.h"
#import "BottomMenu.h"


#import "AllStatusController.h"
// Dock 栏的使用
@interface MainViewController ()<BottomMenuDelegate,TabbarDelegate,DockBtnDelegate,DockBtnDelegate>
{
    Dock *_dock;
}

@property (nonatomic, weak)UIView *contentView;
@property (nonatomic, assign)NSInteger currentIndex;

@end

@implementation MainViewController



#pragma mark -  添加Dock 并且设置子控件代理


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.设置背景色
    self.view.backgroundColor = [UIColor  colorWithRed:55.0/255 green:55.0/255 blue:55.0/255 alpha:1.0];
    
    //2.初始化Dock
      [self setupDock];
    
    //3.初始化控制器
    [self setupControllers];
    
    //4.初始化内容View
    [self setupContentView];
    
    //5.设置初始显示的视图
    [self TabbarClick:nil fromIndex:0 toIndex:self.childViewControllers.count -1];
}


//添加Dock栏
- (void)setupDock{
    //1.创建dock
    Dock *dock = [[Dock alloc] init];
    dock.backgroundColor =[UIColor  colorWithRed:34.0/255 green:34.0/255 blue:34.0/255 alpha:1.0];
    dock.height = self.view.height;
    dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _dock = dock;
    dock.delegate = self;
    dock.menu.delegate = self;
    dock.tabbar.delegate =self;
    //拿到屏幕方向 设置Dock的width;
    BOOL isLandScape = self.view.width == kLandscapeWidth;//横屏
    [dock rotateTolandScape:isLandScape];
    [self.view addSubview:dock];
}


//添加子控制器
- (void)setupControllers{
    
    AllStatusController *vc1 = [[AllStatusController alloc] init];
    [self packNav:vc1];

    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"与我相关";
    vc2.view.backgroundColor = [UIColor redColor];
    [self packNav:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"照片墙";
    vc3.view.backgroundColor = [UIColor purpleColor];
    [self packNav:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.title = @"电子相册";
    vc4.view.backgroundColor = [UIColor orangeColor];
    [self packNav:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"好友";
    vc5.view.backgroundColor = [UIColor yellowColor];
    [self packNav:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"更多";
    vc6.view.backgroundColor = [UIColor greenColor];
    [self packNav:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor lightGrayColor];
    [self packNav:vc7];
    
}

- (void)packNav:(UIViewController *)vc{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


//设置子控制器的View
- (void)setupContentView{
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor cyanColor];
    contentView.width = kContentViewWidth;
    contentView.height = self.view.height - 20;
    contentView.x = _dock.width;
    contentView.y = 20;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
}


#pragma mark -  子控件代理Delegate

//图像事件
- (void)DockIconClick:(UIButton *)btn{
    
    NSLog(@"点击了图像");
    
    [self TabbarClick:nil fromIndex:self.currentIndex toIndex:self.childViewControllers.count - 1];
    [_dock.tabbar unSelected];
}



//Tabbar事件
- (void)TabbarClick:(UIButton *)item title:(NSString *)title{
    
    NSLog(@"点击了%@这个按钮",title);
    
}



-(void)TabbarClick:(UIButton *)item fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    NSLog(@"from: %ld to %ld",fromIndex,toIndex);
    
    //1.取出旧的控制器的View,移除
    UIViewController *oldVc = self.childViewControllers[fromIndex];
    [oldVc.view removeFromSuperview];
    //2.取出新的控制器的View添加上去
    UIViewController *newVc = self.childViewControllers[toIndex];
    newVc.view.width = kContentViewWidth;
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
    self.currentIndex = toIndex;
}




//底部按钮事件
- (void)bottomMenuClick:(BottomMenu *)menu Type:(BottomMenuItemType)type{
    
    switch (type) {
        case kBottomMenuItemTypeMood:{
            NSLog(@"点击了发表心情这个按钮");
            MoodViewController *moodVC = [[MoodViewController alloc] init];
            UINavigationController *moodNaVC = [[UINavigationController alloc] initWithRootViewController:moodVC];
            
            //1.设置呈现样式
            moodNaVC.modalPresentationStyle = UIModalPresentationFormSheet;
            
            //2.设置过度样式
//            moodNaVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            
            [self presentViewController:moodNaVC animated:YES completion:nil];
            
            
        }break;
        case kBottomMenuItemTypePhoto:
            NSLog(@"点击了发表照片这个按钮");
            
            break;
        case kBottomMenuItemTypeBlog:
            NSLog(@"点击了发表日志这个按钮");
            
            break;
            
        default:
            break;
    }
    
}



#pragma mark -  系统旋转监听

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    //拿到屏幕方向 设置Dock的width;
    BOOL isLandScape = size.width == kLandscapeWidth;//横屏
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
        
        [_dock rotateTolandScape:isLandScape];
        self.contentView.x = _dock.width;
    }];
    
    
    
}



@end
