//
//  ApplyRefundVC.h
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/19.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import "OrderModel.h"
#import "GoodsModel.h"

@interface ApplyRefundVC : UIViewController

@property (nonatomic,assign) int goodsIndex; //订单中的第几个商品
@property (nonatomic,retain) OrderModel *orderModel;
@property (nonatomic,retain) GoodsModel *goodsModel;

@end
