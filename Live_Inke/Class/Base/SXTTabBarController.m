//
//  SXTTabBarController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTTabBarController.h"
#import "SXTTabBar.h"
#import "SXTNavigationController.h"
#import "SXTLaunchViewController.h"

@interface SXTTabBarController ()<SXTTabBarDelegate>
/*加载的Tabbar*/
@property(nonatomic,strong)SXTTabBar * sxtTabBar;
@end

@implementation SXTTabBarController

-(SXTTabBar *)sxtTabBar{
    if (!_sxtTabBar) {
        _sxtTabBar =[[SXTTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _sxtTabBar.delegate = self;
    }
    return _sxtTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViewControllers];
    /*加载Tabbar*/
    [self.tabBar addSubview:self.sxtTabBar];
    
    /*Tabbar的线*/
    [[UITabBar appearance]setShadowImage:[UIImage new]];
    [[UITabBar appearance]setBackgroundImage:[UIImage new]];
}


-(void)configViewControllers{
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"SXTMainViewController",@"SXTMeViewController"]];
    for (NSInteger i=0; i<array.count; i++) {
        
        NSString * vcName =[array objectAtIndex:i];
        UIViewController * VC =[[NSClassFromString(vcName) alloc]init];
        SXTNavigationController * Nvi =[[SXTNavigationController alloc]initWithRootViewController:VC];
        [array replaceObjectAtIndex:i withObject:Nvi];
    }
    
    self.viewControllers=array;
}

#pragma mark
-(void)tabbar:(SXTTabBar *)tabbar ClickBtn:(SXTItemType)idx{
    
    if (idx !=SXTItemTypeLaunch) {
        self.selectedIndex = idx-SXTItemTypeLive;
        return;
    }
    //模态视图
    SXTLaunchViewController * VC =[[SXTLaunchViewController alloc]init];
    [self presentViewController:VC animated:YES completion:nil];
}

@end
