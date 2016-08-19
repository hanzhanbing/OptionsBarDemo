//
//  AllOrderVC.h
//  LHOptionsBarRealize
//
//  Created by hanzhanbing on 16/7/12.
//  Copyright © 2016年 duo mei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDelegate.h"

typedef void (^OrderCancelBlock) (NSString *orderId);
typedef void (^OrderRefundBlock) (OrderModel *orderModel, int goodsIndex);
typedef void (^OrderConfirmBlock) (NSString *orderId);

@interface AllOrderVC : UIViewController<OrderDelegate>

@property (nonatomic,copy) OrderCancelBlock cancelBlock; //取消订单
@property (nonatomic,copy) OrderRefundBlock refundBlock; //退款
@property (nonatomic,copy) OrderConfirmBlock confirmBlock; //确认收货

@end
