//
//  SXTNavigationController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTNavigationController.h"

@interface SXTNavigationController ()

@end

@implementation SXTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航条的颜色
    UIColor * radomcolor = [UIColor colorWithRed:36/255.0 green:215/255.0 blue:200/255.0 alpha:1];
    self.navigationBar.barTintColor = radomcolor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}


@end
