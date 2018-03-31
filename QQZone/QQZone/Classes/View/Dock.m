//
//  Dock.m
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "Dock.h"
#import "BottomMenu.h"
#import "Tabbar.h"
#import "IconButton.h"

@interface Dock()

@end

@implementation Dock

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupBottomMenu];
        [self setupTarbar];
        [self setupIconButton];
    }
    return self;
}


//添加底部菜单兰
- (void)setupBottomMenu{
    BottomMenu *menu = [[BottomMenu alloc] init];
    _menu = menu;
    menu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    menu.backgroundColor =[UIColor  colorWithRed:34.0/255 green:34.0/255 blue:34.0/255 alpha:1.0];
    //[UIColor purpleColor];
    [self addSubview:menu];
}


//添加Tabbar
- (void)setupTarbar{
    Tabbar *tabbar = [[Tabbar alloc] init];
    _tabbar = tabbar;
    tabbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    tabbar.backgroundColor = [UIColor  colorWithRed:34.0/255 green:34.0/255 blue:34.0/255 alpha:1.0];
    //[UIColor orangeColor];
    [self addSubview:tabbar];
    
}


//添加图像图标
- (void)setupIconButton{
    IconButton *iconBtn = [[IconButton alloc] init];
    _iconBtn = iconBtn;
//    _iconBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _iconBtn.backgroundColor =[UIColor  colorWithRed:34.0/255 green:34.0/255 blue:34.0/255 alpha:1.0];
    [_iconBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:iconBtn];
}

- (void)BtnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(DockIconClick:)]) {
        [self.delegate DockIconClick:btn];
    }
    
}

- (void)rotateTolandScape:(BOOL)isLandsacpe{
    //1.设置dock的宽度
    self.width = isLandsacpe ? kDockscapeWidth : kDockPortraitWidth;
    
    //2.底部菜单的旋转
    [_menu rotateTolandScape:isLandsacpe];
    
    //2.tabbar的旋转
    [_tabbar rotateTolandScape:isLandsacpe];
    _tabbar.y = self.height - _menu.height - _tabbar.height;
    
    //3.图像的旋转
    [_iconBtn rotateTolandScape:isLandsacpe];
    
}




@end


