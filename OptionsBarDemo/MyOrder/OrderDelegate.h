//
//  OrderDelegate.h
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/20.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderModel.h"

@protocol OrderDelegate <NSObject>

@optional

/**
 *  取消订单
 *
 *  @param orderId 订单id
 */
- (void)clickCancelOrder:(NSString *)orderId;

/**
 *  退款
 *
 *  @param orderModel 订单Model
 *  @param goodsIndex 订单中的第几个商品
 */
- (void)clickRefundOrder:(OrderModel *)orderModel andGoodsIndex:(int)goodsIndex;

/**
 *  确认收货
 *
 *  @param orderId 订单id
 */
- (void)clickConfirmOrder:(NSString *)orderId;

@end
