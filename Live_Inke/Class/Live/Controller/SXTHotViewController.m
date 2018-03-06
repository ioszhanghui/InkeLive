//
//  SXTHotViewController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/2.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTHotViewController.h"
#import "SXTLiveHandler.h"

@interface SXTHotViewController ()

@end

@implementation SXTHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor cyanColor];
    [self loadData];
}

-(void)loadData{
    [SXTLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
        
    } faild:^(id obj) {
        
    }];
    
}


@end
