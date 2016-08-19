//
//  OrderModel.h
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  订单Model
 */

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    UntreatedOrderType,
    TreatedOrderType,
    CompletedOrderType,
} OrderType;

@interface OrderModel : NSObject

@property (nonatomic,copy) NSString *ID; //订单ID
@property (nonatomic,assign) int type; //订单类型
@property (nonatomic,copy) NSString *time; //订单时间
@property (nonatomic,copy) NSString *status; //订单状态
@property (nonatomic,copy) NSString *shopImage; //商店图片
@property (nonatomic,copy) NSString *shopName; //商店名称
@property (nonatomic,copy) NSString *shopOwner; //商店店主
@property (nonatomic,copy) NSString *shopPhone; //商店联系方式
@property (nonatomic,retain) NSMutableArray *goodsArr; //商品数组
@property (nonatomic,copy) NSString *totalMoney; //总钱
@property (nonatomic,copy) NSString *couponMoney; //优惠券钱
@property (nonatomic,copy) NSString *realMoney; //实付钱

@end
