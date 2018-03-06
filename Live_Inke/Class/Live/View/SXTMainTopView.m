//
//  SXTMainTopView.m
//  Live_Inke
//
//  Created by zhph on 2018/3/2.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTMainTopView.h"
@interface SXTMainTopView()
/*转动的线*/
@property(nonatomic,strong)UIView * line;
/*点击按钮*/
@property(nonatomic,strong)NSMutableArray * btns;

@end

@implementation SXTMainTopView

-(NSMutableArray *)btns{
    if (!_btns) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}
-(instancetype)initWithFrame:(CGRect)frame TitleName:(NSArray*)titles{
    if (self=[super initWithFrame:frame]) {
        
        CGFloat btnW = self.width/titles.count;
        CGFloat btnH= self.height;
        
        for (NSInteger i=0; i<titles.count; i++) {
            UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.frame =CGRectMake(i*btnW, 0, btnW, btnH);
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchDown];
            btn.tag = i;
            [self addSubview:btn];
            
            if (i==1) {
                [btn.titleLabel sizeToFit];
                self.line = [UIView new];
                self.line.backgroundColor = [UIColor whiteColor];
                self.line.frame  =CGRectMake(0, 40, btn.titleLabel.width, 2);
                self.line.centerX= btn.centerX;
                [self addSubview:self.line];
            }
            
            [self.btns addObject:btn];
            
        }
    }
    return self;
}


-(void)titleClick:(UIButton*)btn{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.line.centerX=btn.centerX;
    }];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(mainTopView:DidClick:)]) {
        [self.delegate mainTopView:self DidClick:btn.tag];
    }
}

-(void)scrollLineAtIndex:(NSInteger)index{
    
    UIButton * btn = [_btns objectAtIndex:index];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.line.centerX=btn.centerX;
    }];
}

@end
