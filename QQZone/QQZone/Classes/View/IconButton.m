//
//  IconButton.m
//  QQZone
//
//  Created by developershang on 2017/4/21.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "IconButton.h"

@implementation IconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
        [self setTitle:@"帅伟少" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


- (void)rotateTolandScape:(BOOL)isLandsacpe{
    self.width = isLandsacpe?kIconButtonLandscapeWidth:kIconButtonPortraitWH;
    self.height = isLandsacpe?kIconButtonLandscapeHeight:kIconButtonPortraitWH;
    
    self.x = (self.superview.width - self.width) * 0.5;
    self.y = kIconButtonY;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) {//竖屏
        return self.bounds;
    }else{
       
        CGFloat width = self.width;
        CGFloat height = width;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
        
    }
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (self.width == self.height) {
        return CGRectMake(0, 0, -1, -1);
    }else{
        CGFloat width = self.width;
        CGFloat height = self.height - width;;
        CGFloat x = 0;
        CGFloat y = width + 2;
        return CGRectMake(x, y, width, height);
    }
    
}

@end
