//
//  GoodsModel.h
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  商品Model
 */

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic,copy) NSString *ID;    //ID
@property (nonatomic,copy) NSString *icon;  //图标
@property (nonatomic,copy) NSString *name;  //名称
@property (nonatomic,copy) NSString *count; //数量
@property (nonatomic,copy) NSString *price; //单价

@end
