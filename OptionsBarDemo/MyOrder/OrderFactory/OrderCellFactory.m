//
//  OrderCellFactory.m
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import "OrderCellFactory.h"
#import "UntreatedOrderCell.h"
#import "TreatedOrderCell.h"
#import "CompletedOrderCell.h"

@implementation OrderCellFactory

+ (OrderBaseCell *)getCell:(OrderModel *)orderModel withCellStyle:(UITableViewCellStyle)cellStyle withCellIdentifier:(NSString *)reuseIdentifier {
    
    OrderBaseCell *baseCell;
    
    switch (orderModel.type) {
        case UntreatedOrderType:
            baseCell = [[UntreatedOrderCell alloc] initWithStyle:cellStyle reuseIdentifier:reuseIdentifier];
            break;
        case TreatedOrderType:
            baseCell = [[TreatedOrderCell alloc] initWithStyle:cellStyle reuseIdentifier:reuseIdentifier];
            break;
        case CompletedOrderType:
            baseCell = [[CompletedOrderCell alloc] initWithStyle:cellStyle reuseIdentifier:reuseIdentifier];
            break;
            
        default:
            break;
    }
    return baseCell;
}

+ (NSString *)getCellIdentifier:(OrderModel *)orderModel {
    
    switch (orderModel.type) {
        case UntreatedOrderType:
            return [UntreatedOrderCell getIdentifier];
            break;
        case TreatedOrderType:
            return [TreatedOrderCell getIdentifier];
            break;
        case CompletedOrderType:
            return [CompletedOrderCell getIdentifier];
            break;
            
        default:
            break;
    }
    return nil;
}

+ (CGFloat)getCellHeight:(OrderModel *)orderModel {
    
    switch (orderModel.type) {
        case UntreatedOrderType:
            return [UntreatedOrderCell getHeight:orderModel];
            break;
        case TreatedOrderType:
            return [TreatedOrderCell getHeight:orderModel];
            break;
        case CompletedOrderType:
            return [CompletedOrderCell getHeight:orderModel];
            break;
            
        default:
            break;
    }
    return 0;
}

@end
