//
//  SXTBaseHandler.h
//  Live_Inke
//
//  Created by 小飞鸟 on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import <Foundation/Foundation.h>
//处理完成
typedef void(^ CompleteBlock)(void);
//处理成功 返回json数据
typedef void(^SuccessBlock)(id obj);
//处理失败 obj 错误信息
typedef void(^FailBlock)(id obj);

@interface SXTBaseHandler : NSObject

@end
