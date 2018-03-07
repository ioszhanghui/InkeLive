//
//  SXTHotViewController.m
//  Live_Inke
//
//  Created by zhph on 2018/3/2.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SXTHotViewController.h"
#import "SXTLiveHandler.h"
#import "SXTLiveCell.h"

@interface SXTHotViewController ()
/*数据源*/
@property(nonatomic,strong)NSMutableArray * dataList;

@end

@implementation SXTHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    [self loadData];
}

-(void)initUI{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SXTLiveCell" bundle:nil] forCellReuseIdentifier:@"Live"];
    
    
}

-(void)loadData{
    [SXTLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } faild:^(id obj) {
        
    }];
}


-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList=[NSMutableArray array];
    }
    return _dataList;
}
#pragma mark tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataList.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SXTLiveCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Live"];
    cell.live =[self.dataList objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70+SCREEN_WIDTH;
}

/*
 图像 音频 元数据 编码格式
 
 音频处理 AAC
 RTMP协议
 
 
 */



@end
