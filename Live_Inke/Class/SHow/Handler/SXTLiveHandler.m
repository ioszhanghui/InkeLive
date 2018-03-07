//
//  SXTLiveHandler.m
//  Live_Inke
//
//  Created by 小飞鸟 on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTLiveHandler.h"
#import "SXTLive.h"

@implementation SXTLiveHandler

+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success faild:(FailBlock)fail{
    
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        if ([json[@"dm_error"]integerValue]) {
            fail(json);
        }else{
          NSArray * lives =  [SXTLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}
@end
