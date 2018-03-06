//
//  SXTMainViewController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTMainViewController.h"
#import "SXTMainTopView.h"

@interface SXTMainViewController ()<UIScrollViewDelegate,SXTMainTopViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property(nonatomic,strong)NSArray * dataList;
/*顶部的 热门 附近 关注*/
@property(nonatomic,strong)SXTMainTopView * mainTopView;

@end

@implementation SXTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(NSArray *)dataList{
    if (!_dataList) {
        _dataList= @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

-(SXTMainTopView *)mainTopView{
    if (!_mainTopView) {
        _mainTopView =[[SXTMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) TitleName:self.dataList];
        _mainTopView.delegate=self;
    }
    return _mainTopView;
}
#pragma mark mainTopView代理
-(void)mainTopView:(SXTMainTopView *)mainTopView DidClick:(NSInteger)index{
    
    NSLog(@"%f",index*SCREEN_WIDTH);
    CGPoint point = CGPointMake(index*SCREEN_WIDTH, 0);
    [self.contentScrollView setContentOffset:point animated:YES];
//    self.contentScrollView.contentOffset = CGPointMake(index*SCREEN_WIDTH, 0);
//    [self.contentScrollView.delegate scrollViewDidEndDecelerating:self.contentScrollView];
}

#pragma mark 布局UI
-(void)initUI{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil  action:nil];
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil  action:nil];
    self.navigationItem.titleView =self.mainTopView;
    [self addChildController];
}
//添加自视图控制器
-(void)addChildController{
    
    NSArray * vcNames =@[@"SXTFocuseViewController",@"SXTHotViewController",@"SXTNearViewController"];
    for (NSInteger i=0; i<vcNames.count; i++) {
        UIViewController * VC =[[NSClassFromString([vcNames objectAtIndex:i])alloc]init];
        VC.title=[self.dataList objectAtIndex:i];
        // addChildViewController 不会执行viewDidLoad方法
        [self addChildViewController:VC];
    }
    //将子控制器的View 添加到mainViewController 的scrollView上
    self.contentScrollView.contentSize=CGSizeMake(SCREEN_WIDTH* self.dataList.count, 0);
    self.contentScrollView.pagingEnabled=YES;
    self.contentScrollView.showsVerticalScrollIndicator=NO;
    self.contentScrollView.showsHorizontalScrollIndicator=NO;
    //默认展示第二个
    self.contentScrollView.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
     [self scrollViewDidEndDecelerating:self.contentScrollView];
}

#pragma mark UIScrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CGFloat width =scrollView.frame.size.width;
    CGFloat height =SCREEN_HEIGHT;
    
    NSInteger index =scrollView.contentOffset.x/width;
    
    UIViewController * VC = self.childViewControllers[index];
    [self.mainTopView scrollLineAtIndex:index];
    if (VC.isViewLoaded){
        return;
    }
    VC.view.frame=CGRectMake(scrollView.contentOffset.x, 0, width, height);
    [self.contentScrollView addSubview:VC.view];
    
    
}

@end
