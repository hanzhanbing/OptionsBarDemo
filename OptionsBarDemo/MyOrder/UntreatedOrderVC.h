//
//  UntreatedOrderVC.h
//  LHOptionsBarRealize
//
//  Created by hanzhanbing on 16/7/12.
//  Copyright © 2016年 duo mei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDelegate.h"

typedef void (^OrderCancelBlock) (NSString *orderId);

@interface UntreatedOrderVC : UIViewController<OrderDelegate>

@property (nonatomic,copy) OrderCancelBlock cancelBlock; //取消订单

@end
