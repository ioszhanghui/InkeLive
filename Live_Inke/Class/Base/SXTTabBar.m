//
//  SXTTabBar.m
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTTabBar.h"

@interface SXTTabBar()
/*背景图*/
@property(nonatomic,strong)UIImageView * tabbgView;
/*数据源*/
@property(nonatomic,strong)NSArray * dataList;
/*上一个按钮*/
@property(nonatomic,strong)UIButton * lastBtn;
/*相机按钮*/
@property(nonatomic,strong)UIButton * cameraBtn;

@end

@implementation SXTTabBar

-(NSArray *)dataList{
    if (!_dataList) {
        
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

-(UIImageView*)tabbgView{
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        
        _cameraBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchDown];
        _cameraBtn.tag=SXTItemTypeLaunch;
        _cameraBtn.adjustsImageWhenHighlighted=NO;
    }
    
    return _cameraBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //装载的背景
        [self addSubview:self.tabbgView];
        for (NSInteger i=0; i<self.dataList.count; i++) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //图片高亮状态下显示
            btn.adjustsImageWhenHighlighted=NO;
            [btn setImage:[UIImage imageNamed:[self.dataList objectAtIndex:i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[[self.dataList objectAtIndex:i]stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchDown];
            btn.tag = SXTItemTypeLive+i;
            if (i==0) {
                btn.selected = YES;
                self.lastBtn=btn;
            }
            [self addSubview:btn];
        }
        
        [self addSubview:self.cameraBtn];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    CGFloat height= self.bounds.size.height;
    
    CGFloat width =self.bounds.size.width/self.dataList.count;
    
    for(UIView * view in self.subviews){
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton*)view;
            view.frame=CGRectMake((btn.tag-SXTItemTypeLive)*width, 0, width,height);
        }
    }
    [_cameraBtn sizeToFit];
    self.cameraBtn.center =CGPointMake(self.bounds.size.width/2, self.bounds.size.height-50);
}

#pragma mark 点击事件
-(void)clickItem:(UIButton*)btn{
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(tabbar:ClickBtn:)]) {
        [self.delegate tabbar:self ClickBtn:btn.tag];
    }
    
    if (btn.tag==SXTItemTypeLaunch) {
        return;
    }
    
    self.lastBtn.selected=NO;
    self.lastBtn=btn;
    self.lastBtn.selected=YES;
    //tabbar的弹出动画
    [UIView animateWithDuration:0.2 animations:^{
        
        btn.transform=CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform=CGAffineTransformIdentity;
        }];
    }];

}

@end
