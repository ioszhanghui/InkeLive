//
//  AppDelegate.m
//  Live_Inke
//
//  Created by zhph on 2018/3/1.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "AppDelegate.h"
#import "SXTTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    SXTTabBarController * tab =[[SXTTabBarController alloc]init];
    self.window.rootViewController = tab;
    
    return YES;
}

@end
