//
//  MyOrderVC.m
//  SuperMarket
//
//  Created by 柯南 on 16/7/12.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  我的订单
 */

#import "MyOrderVC.h"

@interface MyOrderVC ()

@end

@implementation MyOrderVC

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout
{
    return UIRectEdgeNone;
}
#endif

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    
    //全部订单
    AllOrderVC *allOrderVC = [[AllOrderVC alloc] init];
    [allOrderVC setCancelBlock:^(NSString *orderId){ //取消订单
        NSLog(@"取消订单ID:%@",orderId);
    }];
    [allOrderVC setRefundBlock:^(OrderModel *orderModel, int goodsIndex){ //退款
        ApplyRefundVC *applyRefundVC = [[ApplyRefundVC alloc] init];
        applyRefundVC.orderModel = orderModel;
        applyRefundVC.goodsIndex = goodsIndex;
        [self.navigationController pushViewController:applyRefundVC animated:NO];
    }];
    [allOrderVC setConfirmBlock:^(NSString *orderId){ //确认收货
        NSLog(@"确认收货订单ID:%@",orderId);
    }];
    
    //未处理订单
    UntreatedOrderVC *untreatedOrderVC = [[UntreatedOrderVC alloc] init];
    [untreatedOrderVC setCancelBlock:^(NSString *orderId){ //取消订单
        NSLog(@"取消订单ID:%@",orderId);
    }];
    
    //处理中订单
    TreatedOrderVC *treatedOrderVC = [[TreatedOrderVC alloc] init];
    [treatedOrderVC setRefundBlock:^(OrderModel *orderModel, int goodsIndex){ //退款
        ApplyRefundVC *applyRefundVC = [[ApplyRefundVC alloc] init];
        applyRefundVC.orderModel = orderModel;
        applyRefundVC.goodsIndex = goodsIndex;
        [self.navigationController pushViewController:applyRefundVC animated:NO];
    }];
    [treatedOrderVC setConfirmBlock:^(NSString *orderId){ //确认收货
        NSLog(@"确认收货订单ID:%@",orderId);
    }];
    
    //已完成订单
    CompletedOrderVC *completedOrderVC = [[CompletedOrderVC alloc] init];
    
    NSArray *controllersArr = @[allOrderVC, untreatedOrderVC, treatedOrderVC,completedOrderVC];
    OptionBarController *navTabBarController = [[OptionBarController alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44) andSubViewControllers:controllersArr andParentViewController:self andSelectedViewColor:[UIColor whiteColor] andSelectedTextColor:AppThemeColor andShowSeperateLine:NO andShowBottomLine:YES];
    navTabBarController.linecolor=AppThemeColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
