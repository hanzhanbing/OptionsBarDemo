//
//  CompletedOrderCell.m
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  完成订单cell
 */

#import "CompletedOrderCell.h"

@interface CompletedOrderCell ()
{
    UILabel *_timeLab; 
    UIView  *_whiteBgView;
    UILabel *_shopLab;
    UILabel *_totalMoneyLab;
    UILabel *_couponMoneyLab;
    UILabel *_realMoneyLab;
    NSMutableArray *_goodsArr; //商品Items布局数组
}
@end

@implementation CompletedOrderCell

- (void)addContentView {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    _goodsArr = [NSMutableArray array];
    
    //时间
    _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 200, 20)];
    _timeLab.font = [UIFont systemFontOfSize:16];
    _timeLab.textColor = kColorFromARGBHex(0x000000,0.76);
    [self addSubview:_timeLab];
    
    //白色背景
    _whiteBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, WIDTH, 100)];
    _whiteBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_whiteBgView];
    
    //商店
    _shopLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 40, WIDTH-20, 50)];
    _shopLab.font = [UIFont systemFontOfSize:16];
    _shopLab.textColor = kColorFromARGBHex(0x000000,0.76);
    [self addSubview:_shopLab];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 89, WIDTH, 1)];
    lineView.backgroundColor = kColorFromRGBHex(0xECECEC);
    [self addSubview:lineView];
    
    //总计
    _totalMoneyLab = [[UILabel alloc] init];
    _totalMoneyLab.font = [UIFont systemFontOfSize:12];
    _totalMoneyLab.textColor = kColorFromARGBHex(0x000000,0.56);
    [self addSubview:_totalMoneyLab];
    
    //优惠券
    _couponMoneyLab = [[UILabel alloc] init];
    _couponMoneyLab.font = [UIFont systemFontOfSize:12];
    _couponMoneyLab.textColor = kColorFromARGBHex(0x000000,0.56);
    [self addSubview:_couponMoneyLab];
    
    //实付
    _realMoneyLab = [[UILabel alloc] init];
    _realMoneyLab.font = [UIFont systemFontOfSize:14];
    _realMoneyLab.textColor = kColorFromARGBHex(0x000000,0.76);
    _realMoneyLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:_realMoneyLab];
}

- (void)setContentView:(OrderModel *)orderModel {
    _timeLab.text = orderModel.time;
    _shopLab.text = orderModel.shopName;
    
    NSMutableArray *goodsArr = orderModel.goodsArr;
    _whiteBgView.frame = CGRectMake(0, 40, WIDTH, 100+orderModel.goodsArr.count*66);
    
    //解决goodsItem复用
    for (int i = 0; i < [_goodsArr count]; i++) {
        UIView *view = (UIView *)[_goodsArr objectAtIndex:i];
        if (view.superview) {
            [view removeFromSuperview];
        }
    }
    [_goodsArr removeAllObjects];
    
    //goodsItem动态布局
    for (int i = 0; i<goodsArr.count; i++) {
        GoodsModel *goodsModel = goodsArr[i];
        
        UIView *goodsItemView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_shopLab.frame)+66*i, WIDTH, 66)];
        [self addSubview:goodsItemView];
        [_goodsArr addObject:goodsItemView];
        
        UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 5, 56, 56)];
        headImg.image = [UIImage imageNamed:goodsModel.icon];
        [goodsItemView addSubview:headImg];
        
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImg.frame)+20, 8, 150, 20)];
        nameLab.text = goodsModel.name;
        nameLab.font = [UIFont systemFontOfSize:14];
        nameLab.textColor = kColorFromARGBHex(0x000000,0.56);
        [goodsItemView addSubview:nameLab];
        
        UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-120, 8, 40, 20)];
        countLab.text = [NSString stringWithFormat:@"x%@",goodsModel.count];
        countLab.textAlignment = NSTextAlignmentRight;
        countLab.font = [UIFont systemFontOfSize:14];
        countLab.textColor = kColorFromARGBHex(0x000000,0.56);
        [goodsItemView addSubview:countLab];
        
        UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-76, 8, 60, 20)];
        priceLab.text = [NSString stringWithFormat:@"￥%@",goodsModel.price];
        priceLab.textAlignment = NSTextAlignmentRight;
        priceLab.font = [UIFont systemFontOfSize:14];
        priceLab.textColor = kColorFromARGBHex(0x000000,0.56);
        [goodsItemView addSubview:priceLab];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 66, WIDTH, 1.0)];
        line.backgroundColor = kColorFromRGBHex(0xECECEC);
        [goodsItemView addSubview:line];
        
        if (i == goodsArr.count-1) {
            _totalMoneyLab.frame = CGRectMake(16, CGRectGetMaxY(goodsItemView.frame), 90, 50);
            _couponMoneyLab.frame = CGRectMake(CGRectGetMaxX(_totalMoneyLab.frame), CGRectGetMaxY(goodsItemView.frame), 80, 50);
            _realMoneyLab.frame = CGRectMake(WIDTH-116, CGRectGetMaxY(goodsItemView.frame), 100, 50);
        }
    }
    
    _totalMoneyLab.text = [NSString stringWithFormat:@"总计￥%@",orderModel.totalMoney];
    _couponMoneyLab.text = [NSString stringWithFormat:@"优惠券￥%@",orderModel.couponMoney];
    _realMoneyLab.text = [NSString stringWithFormat:@"实付￥%@",orderModel.realMoney];
}

+ (NSString *)getIdentifier {
    return @"CompletedOrderIdentifier";
}

+ (CGFloat)getHeight:(OrderModel *)orderModel {
    return 140+66*orderModel.goodsArr.count;
}

@end
