//
//  Tabbar.m
//  QQZone
//
//  Created by developershang on 2017/4/21.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "Tabbar.h"
const CGFloat kRatio = 0.4;
@interface Tabbar ()


@property (nonatomic, weak)TabarItem *selectedItem;

@end


@implementation Tabbar

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupTabbarItemWithImageName:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupTabbarItemWithImageName:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupTabbarItemWithImageName:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupTabbarItemWithImageName:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupTabbarItemWithImageName:@"tab_bar_friend_icon" title:@"好友"];
        [self setupTabbarItemWithImageName:@"tab_bar_e_more_icon" title:@"更多"];
    }
    return self;
    
}

- (void)setupTabbarItemWithImageName:(NSString *)imageName title:(NSString *)title{
    
    TabarItem *item = [[TabarItem alloc] init];
    [item setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    item.tag = self.subviews.count;
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:item];
    
}

- (void)itemClick:(TabarItem *)sender{
 
    //监听事件1
    if ([self.delegate respondsToSelector:@selector(TabbarClick:title:)]) {
    [self.delegate TabbarClick:sender title:sender.titleLabel.text];
    }
    //监听事件2
    if ([self.delegate respondsToSelector:@selector(TabbarClick:fromIndex:toIndex:)]) {
    [self.delegate TabbarClick:sender fromIndex:self.selectedItem.tag toIndex:sender.tag];
    }
    
    self.selectedItem.selected = NO;
    sender.selected = YES;
    self.selectedItem = sender;
}

- (void)rotateTolandScape:(BOOL)isLandscape{
    self.width = self.superview.width;
    self.height = kDockItemHeight *6;
    
    //1.子控件的个数
    NSInteger count = self.subviews.count;
    
    // 2.设置子控件的frame
    for (int i = 0; i < count; i++) {
        UIButton *item = self.subviews[i];
        item.width = self.superview.width;
        item.height = kDockItemHeight;
        item.x =  0;
        item.y = item.height * i;
    }
    
    
}


-(void)unSelected{
    self.selectedItem.selected = NO;
}
@end





@implementation TabarItem


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

//这里重写了高亮状态的方法
- (void)setHighlighted:(BOOL)highlighted{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    if (self.width == self.height) {//竖屏
        return self.bounds;
        
    }else{
        CGFloat width = self.width * kRatio;
        CGFloat height = self.height;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
        
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    if (self.width == self.height) { // 竖屏
        return CGRectMake(0, 0, -1, -1);
    } else { // 横屏
        CGFloat width = self.width * (1 - kRatio);
        CGFloat height = self.height;
        CGFloat x = self.width * kRatio;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}



@end




