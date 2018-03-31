//
//  BottomMenu.m
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "BottomMenu.h"

@implementation BottomMenu



- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBottomMenuItemWithImageName:@"tabbar_mood" type:kBottomMenuItemTypeMood];
        [self setupBottomMenuItemWithImageName:@"tabbar_photo" type:kBottomMenuItemTypePhoto];
        [self setupBottomMenuItemWithImageName:@"tabbar_blog" type:kBottomMenuItemTypeBlog];
}
    return self;
    
}

- (void)setupBottomMenuItemWithImageName:(NSString *)imageName type:(BottomMenuItemType)type{
    UIButton *item = [[UIButton alloc] init];
    item.tag = type;
    [item setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    item.tag = type;
    
    [self addSubview:item];
}

- (void)itemClick:(UIButton *)item{


    if ([self.delegate respondsToSelector:@selector(bottomMenuClick:Type:)]) {
        [self.delegate bottomMenuClick:self Type:(BottomMenuItemType)item.tag];
    }
}

//添加底部Menu的三个按钮 不布局
- (void)setupButtonitemWithImgName:(NSString *)img{
    
    UIButton *item = [[UIButton alloc] init];
    [item setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self addSubview:item];

}


// 旋转确定布局
- (void)rotateTolandScape:(BOOL)isLandscape{
    self.width = self.superview.width;
    self.height = isLandscape?kDockItemHeight:kDockItemHeight *3;
    self.y = self.superview.height - self.height;
    
    
    // 0.拿到子控件的个数
    NSInteger count = self.subviews.count;

    // 2.设置子控件的frame
    for (int i = 0; i < count; i++) {
        UIButton *item = self.subviews[i];
        item.width = isLandscape ? self.width / count : self.width;
        item.height = kDockItemHeight;
        item.x = isLandscape ? item.width * i : 0;
        item.y = isLandscape ? 0 : item.height * i;
    }
}


@end


