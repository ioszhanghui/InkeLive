//
//  SXTTabBar.h
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, SXTItemType)   {
    
    SXTItemTypeLaunch = 10,//启动直播
    SXTItemTypeLive = 100,//展示直播
    SXTItemTypeMe,//我的
} ;

@class SXTTabBar;

typedef void(^TabBlock)(SXTTabBar* tabbar,SXTItemType idx);

@protocol SXTTabBarDelegate <NSObject>

-(void)tabbar:(SXTTabBar*)tabbar  ClickBtn:(SXTItemType)idx;

@end

@interface SXTTabBar : UIView

@property(nonatomic,weak)id<SXTTabBarDelegate>delegate;

@property(nonatomic,copy)TabBlock block;

@end
