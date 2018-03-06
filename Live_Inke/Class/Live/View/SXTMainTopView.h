//
//  SXTMainTopView.h
//  Live_Inke
//
//  Created by zhph on 2018/3/2.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SXTMainTopView;
@protocol SXTMainTopViewDelegate<NSObject>

@optional;
-(void)mainTopView:(SXTMainTopView*)mainTopView DidClick:(NSInteger)index;

@end

@interface SXTMainTopView : UIView

-(instancetype)initWithFrame:(CGRect)frame TitleName:(NSArray*)titles;

@property(nonatomic,weak)id<SXTMainTopViewDelegate>delegate;
/*线的滑动*/
-(void)scrollLineAtIndex:(NSInteger)index;

@end
