//
//  MJExtensionConfig.m
//  Live_Inke
//
//  Created by 小飞鸟 on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "SXTLive.h"
#import "SXTCreator.h"

@implementation MJExtensionConfig

+(void)load{
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [SXTLive mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"desciption",     
                 };
    }];
    
    [SXTLive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        
        // nickName -> nick_name
        return [propertyName mj_underlineFromCamel];
    }];
    
    [SXTCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        
        // nickName -> nick_name
        return [propertyName mj_underlineFromCamel];
    }];
    
}
@end
