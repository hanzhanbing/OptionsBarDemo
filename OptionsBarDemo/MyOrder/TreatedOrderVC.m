//
//  TreatedOrderVC.m
//  LHOptionsBarRealize
//
//  Created by hanzhanbing on 16/7/12.
//  Copyright © 2016年 duo mei. All rights reserved.
//

/**
 *  处理中订单
 */

#import "TreatedOrderVC.h"
#import "OrderModel.h"
#import "OrderBaseCell.h"
#import "OrderCellFactory.h"

@interface TreatedOrderVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *cellInfoArr;

@end

@implementation TreatedOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"处理中";
    
    [self initData];
    
    [self addTableView];
    
}

#pragma mark - 加载UITableView
- (void)addTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-108) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = TableViewBGcolor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - 初始化数据
- (void)initData {
    
    _cellInfoArr = [NSMutableArray array];
    
    for (int i=0; i<5; i++) {
        OrderModel *cellInfo = [[OrderModel alloc] init];
        cellInfo.ID = [NSString stringWithFormat:@"%d",100+i];
        cellInfo.type = TreatedOrderType;
        cellInfo.status = @"已接单";
        cellInfo.time = @"2016-06-12";
        cellInfo.shopImage = @"商店默认";
        cellInfo.shopName = @"小依休便民商店（唐家村分店）";
        cellInfo.shopOwner = @"王建军";
        cellInfo.shopPhone = @"13691456798";
        cellInfo.totalMoney = @"26.7";
        cellInfo.couponMoney = @"20.0";
        cellInfo.realMoney = @"21.0";
        
        cellInfo.goodsArr = [NSMutableArray array];
        for (int j=0; j<4; j++) {
            GoodsModel *goodsModel = [[GoodsModel alloc] init];
            goodsModel.ID = [NSString stringWithFormat:@"%d",1000+j];
            goodsModel.icon = @"商品默认";
            goodsModel.name = @"黄豆酱油";
            goodsModel.count = @"10";
            goodsModel.price = @"19.9";
            [cellInfo.goodsArr addObject:goodsModel];
        }
        
        [_cellInfoArr addObject:cellInfo];
    }
}

#pragma mark - UITableView代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderModel *orderModel = _cellInfoArr[indexPath.row];
    return [OrderCellFactory getCellHeight:orderModel];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellInfoArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderModel *orderModel = _cellInfoArr[indexPath.row];
    //编译时、运行时
    NSString *cellIndentifier = [OrderCellFactory getCellIdentifier:orderModel];
    OrderBaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!baseCell) {
        baseCell = [OrderCellFactory getCell:orderModel withCellStyle:UITableViewCellStyleDefault withCellIdentifier:cellIndentifier];
    }
    
    [baseCell setContentView:orderModel];
    
    baseCell.delegate = self;
    
    return baseCell;
}

#pragma mark - OrderDelegate

//退款
- (void)clickRefundOrder:(OrderModel *)orderModel andGoodsIndex:(int)goodsIndex {
    if (self.refundBlock) {
        self.refundBlock(orderModel,goodsIndex);
    }
}

//确认收货
- (void)clickConfirmOrder:(NSString *)orderId {
    NSLog(@"确认收货：%@",orderId);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
