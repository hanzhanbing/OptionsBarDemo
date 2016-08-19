//
//  TreatedOrderVC.h
//  LHOptionsBarRealize
//
//  Created by hanzhanbing on 16/7/12.
//  Copyright © 2016年 duo mei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDelegate.h"

typedef void (^OrderRefundBlock) (OrderModel *orderModel, int goodsIndex);
typedef void (^OrderConfirmBlock) (NSString *orderId);

@interface TreatedOrderVC : UIViewController<OrderDelegate>

@property (nonatomic,copy) OrderRefundBlock refundBlock; //退款
@property (nonatomic,copy) OrderConfirmBlock confirmBlock; //确认收货

@end
