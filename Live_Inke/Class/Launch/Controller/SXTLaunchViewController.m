//
//  SXTLaunchViewController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/2.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTLaunchViewController.h"

@interface SXTLaunchViewController ()

@end

@implementation SXTLaunchViewController
- (IBAction)closeLaunch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
