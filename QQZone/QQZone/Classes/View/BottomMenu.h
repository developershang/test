//
//  BottomMenu.h
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomMenu;

typedef enum {
    kBottomMenuItemTypeMood = 100,
    kBottomMenuItemTypePhoto,
    kBottomMenuItemTypeBlog
} BottomMenuItemType;



@protocol BottomMenuDelegate <NSObject>

@optional

- (void)bottomMenuClick:(BottomMenu*)menu Type:(BottomMenuItemType)type;

@end



@interface BottomMenu : UIView


@property (nonatomic, assign)id <BottomMenuDelegate>delegate;

- (void)rotateTolandScape:(BOOL)isLandsacpe;

@end
