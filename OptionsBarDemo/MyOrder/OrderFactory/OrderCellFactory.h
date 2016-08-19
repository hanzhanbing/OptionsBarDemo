//
//  OrderCellFactory.h
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  订单cell工厂
 */

#import <Foundation/Foundation.h>
#import "OrderBaseCell.h"
#import "OrderModel.h"

@interface OrderCellFactory : NSObject

+ (OrderBaseCell *)getCell:(OrderModel *)orderModel withCellStyle:(UITableViewCellStyle)cellStyle withCellIdentifier:(NSString *)reuseIdentifier;

+ (NSString *)getCellIdentifier:(OrderModel *)orderModel;

+ (CGFloat)getCellHeight:(OrderModel *)orderModel;

@end
