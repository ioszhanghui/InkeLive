//
//  SXTLiveCell.m
//  Live_Inke
//
//  Created by zhph on 2018/3/7.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTLiveCell.h"
#import "UIImageView+SDWebImage.h"

@interface SXTLiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation SXTLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.headView.layer.cornerRadius=25;
//    self.headView.clipsToBounds=YES;
    
}

-(void)setLive:(SXTLive *)live{
    _live=live;
//头像
    [self.headView downloadImage:_live.creator.portrait placeholder:@"default_room.png"];
    [self.bigImageView downloadImage:_live.creator.portrait placeholder:@"default_room.png"];
    self.nameLabel.text=_live.creator.nick;
    self.locationLabel.text =_live.city;
    self.onlineLabel.text =  [@(_live.onlineUsers)stringValue];
}

@end
