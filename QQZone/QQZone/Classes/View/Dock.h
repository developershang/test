//
//  Dock.h
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DockBtnDelegate <NSObject>


- (void)DockIconClick:(UIButton *)btn;

@end
@class IconButton,Tabbar,BottomMenu;
@interface Dock : UIView

@property(nonatomic, assign)id<DockBtnDelegate>delegate;

@property(nonatomic, weak,readonly)IconButton *iconBtn;
@property(nonatomic, weak,readonly)Tabbar *tabbar;
@property(nonatomic, weak,readonly)BottomMenu *menu;


- (void)rotateTolandScape:(BOOL)isLandsacpe;


@end
