//
//  TreatedOrderCell.m
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  处理中订单cell
 */

#import "TreatedOrderCell.h"

@interface TreatedOrderCell ()
{
    UILabel *_timeLab; 
    UIView  *_whiteBgView;
    UILabel *_shopLab;
    UILabel *_statusLab;
    UILabel *_totalMoneyLab;
    UILabel *_couponMoneyLab;
    UILabel *_realMoneyLab;
    UIView  *_bottomLine;
    UIButton *_confirmBtn; //确认收货
    NSMutableArray *_goodsArr; //商品Items布局数组
    OrderModel *_orderModel;
}
@end

@implementation TreatedOrderCell

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
    
    //订单状态
    _statusLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-76, 40, 60, 50)];
    _statusLab.font = [UIFont systemFontOfSize:16];
    _statusLab.textColor = kColorFromRGBHex(0xFCAA1B);
    _statusLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:_statusLab];
    
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
    
    //底部横线
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = kColorFromRGBHex(0xECECEC);
    [self addSubview:_bottomLine];
    
    //确认收货
    _confirmBtn = [[UIButton alloc] init];
    _confirmBtn.backgroundColor = kColorFromRGBHex(0xFC821B);
    [_confirmBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmBtn];
}

- (void)setContentView:(OrderModel *)orderModel {
    
    _orderModel = orderModel;
    
    _timeLab.text = orderModel.time;
    _shopLab.text = orderModel.shopName;
    _statusLab.text = orderModel.status;
    
    NSMutableArray *goodsArr = orderModel.goodsArr;
    _whiteBgView.frame = CGRectMake(0, 40, WIDTH, 150+orderModel.goodsArr.count*66);
    
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
        
        //退款
        UIButton *refundBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-76, 35, 60, 25)];
        refundBtn.tag = 10000+i;
        [refundBtn setTitle:@"退款" forState:UIControlStateNormal];
        [refundBtn setTitleColor:kColorFromARGBHex(0x000000,0.78) forState:UIControlStateNormal];
        refundBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [refundBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight]; //文字居右显示
        [refundBtn addTarget:self action:@selector(refundAction:) forControlEvents:UIControlEventTouchUpInside];
        [goodsItemView addSubview:refundBtn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 66, WIDTH, 1.0)];
        line.backgroundColor = kColorFromRGBHex(0xECECEC);
        [goodsItemView addSubview:line];
        
        if (i == goodsArr.count-1) {
            _totalMoneyLab.frame = CGRectMake(16, CGRectGetMaxY(goodsItemView.frame), 90, 50);
            _couponMoneyLab.frame = CGRectMake(CGRectGetMaxX(_totalMoneyLab.frame), CGRectGetMaxY(goodsItemView.frame), 80, 50);
            _realMoneyLab.frame = CGRectMake(WIDTH-116, CGRectGetMaxY(goodsItemView.frame), 100, 50);
            
            _bottomLine.frame = CGRectMake(0, CGRectGetMaxY(_totalMoneyLab.frame), WIDTH, 1);
            _confirmBtn.frame = CGRectMake(WIDTH-96, CGRectGetMaxY(_totalMoneyLab.frame)+8, 80, 34);
        }
    }
    
    _totalMoneyLab.text = [NSString stringWithFormat:@"总计￥%@",orderModel.totalMoney];
    _couponMoneyLab.text = [NSString stringWithFormat:@"优惠券￥%@",orderModel.couponMoney];
    _realMoneyLab.text = [NSString stringWithFormat:@"实付￥%@",orderModel.realMoney];
}

#pragma mark - event response
//确认收货
- (void)confirmAction:(UIButton *)btn {
    //NSLog(@"确认收货");
    if ([self.delegate respondsToSelector:@selector(clickConfirmOrder:)]) {
        [self.delegate clickConfirmOrder:_orderModel.ID];
    }
}

//退款
- (void)refundAction:(UIButton *)btn {
    //NSLog(@"退款");
    int index = (int)btn.tag-10000;
    if ([self.delegate respondsToSelector:@selector(clickRefundOrder:andGoodsIndex:)]) {
        [self.delegate clickRefundOrder:_orderModel andGoodsIndex:index];
    }
}

+ (NSString *)getIdentifier {
    return @"TreatedOrderIdentifier";
}

+ (CGFloat)getHeight:(OrderModel *)orderModel {
    return 190+66*orderModel.goodsArr.count;
}

@end
