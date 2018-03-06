//
//  SXTLive.h
//  Live_Inke
//
//  Created by 小飞鸟 on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXTCreator.h"
#import "SXTExtra.h"
#import "SXTActInfo.h"

@interface SXTLive : NSObject

@property (nonatomic, strong) SXTActInfo * actInfo;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SXTCreator * creator;
@property (nonatomic, strong) NSString * extendType;
@property (nonatomic, strong) SXTExtra * extra;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger landscape;
@property (nonatomic, strong) NSArray * like;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * liveType;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@end
