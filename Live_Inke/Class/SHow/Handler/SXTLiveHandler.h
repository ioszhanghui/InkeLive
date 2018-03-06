//
//  SXTLiveHandler.h
//  Live_Inke
//
//  Created by 小飞鸟 on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTBaseHandler.h"

@interface SXTLiveHandler : SXTBaseHandler


/**
 获取热门直播信息

 @param success success
 @param fail fail
 */
+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success faild:(FailBlock)fail;


@end
