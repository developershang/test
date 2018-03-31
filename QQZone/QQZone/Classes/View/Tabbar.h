//
//  Tabbar.h
//  QQZone
//
//  Created by developershang on 2017/4/21.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabbarDelegate <NSObject>

@optional

- (void)TabbarClick:(UIButton *)item title:(NSString *)title;

- (void)TabbarClick:(UIButton *)item fromIndex:(NSInteger)fromIndex  toIndex:(NSInteger)toIndex;


@end

@interface Tabbar : UIView

@property (nonatomic, assign)id <TabbarDelegate>delegate;

- (void)rotateTolandScape:(BOOL)isLandsacpe;

-(void)unSelected;

@end



@interface TabarItem : UIButton



@end
