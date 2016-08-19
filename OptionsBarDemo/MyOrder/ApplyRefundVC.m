//
//  ApplyRefundVC.m
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/19.
//  Copyright © 2016年 柯南. All rights reserved.
//

/**
 *  申请退款
 */

#import "ApplyRefundVC.h"

@interface ApplyRefundVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ApplyRefundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"申请退款";
    
    _goodsModel = _orderModel.goodsArr[_goodsIndex];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-44)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setSeparatorInset:UIEdgeInsetsMake(0,-15,0,0)];
    _tableView.backgroundColor = TableViewBGcolor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    //提交申请
    UIButton *submitApply = [[UIButton alloc] initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
    submitApply.backgroundColor = [UIColor colorWithRed:0.9922 green:0.3608 blue:0.3137 alpha:1.0];
    [submitApply setTitle:@"提交申请" forState:UIControlStateNormal];
    [submitApply setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitApply addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitApply];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0;
    switch (indexPath.section) {
        case 0:
        {
            height = 80;
        }
            break;
        case 1:
        {
            height = 180;
        }
            break;
        case 2:
        {
            height = 94;
        }
            break;
        default:
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 15;
    } else {
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.section) {
        case 0:
        {
            UIButton *headBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 7.5, 65, 65)];
            headBtn.layer.masksToBounds = YES;
            headBtn.layer.cornerRadius = 4;
            [headBtn setBackgroundImage:[UIImage imageNamed:_orderModel.shopImage] forState:UIControlStateNormal];
            [cell.contentView addSubview:headBtn];
            
            UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(85, 8, WIDTH-100, 20)];
            nameLab.font = [UIFont boldSystemFontOfSize:16];
            nameLab.adjustsFontSizeToFitWidth = YES;
            nameLab.textColor = kColorFromRGBHex(0x030303);
            nameLab.text = _orderModel.shopName;
            [cell.contentView addSubview:nameLab];
            
            UILabel *nameLab2 = [[UILabel alloc] initWithFrame:CGRectMake(85, 33, 100, 20)];
            nameLab2.font = [UIFont systemFontOfSize:14];
            nameLab2.adjustsFontSizeToFitWidth = YES;
            nameLab2.textColor = kColorFromARGBHex(0x000000,0.76);
            nameLab2.text = [NSString stringWithFormat:@"店主：%@",_orderModel.shopOwner];
            [cell.contentView addSubview:nameLab2];
            
            UILabel *phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(85, 54, 70, 20)];
            phoneLab.adjustsFontSizeToFitWidth = YES;
            phoneLab.textColor = kColorFromARGBHex(0x000000,0.76);
            phoneLab.font = [UIFont systemFontOfSize:14];
            phoneLab.text = @"联系方式：";
            [cell.contentView addSubview:phoneLab];
            
            UIButton *phoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(phoneLab.frame), 54, 120, 20)];
            phoneBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [phoneBtn setTitle:_orderModel.shopPhone forState:UIControlStateNormal];
            [phoneBtn setTitleColor:AppThemeColor forState:UIControlStateNormal];
            [phoneBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; //文字居左显示
            [phoneBtn addTarget:self action:@selector(shopCall) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:phoneBtn];
        }
            break;
        case 1:
        {
            UILabel *waitLable = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, WIDTH-40, 20)];
            waitLable.text = @"等待商家处理申请";
            waitLable.font = [UIFont systemFontOfSize:16];
            waitLable.textColor = kColorFromARGBHex(0x000000,0.76);
            [cell.contentView addSubview:waitLable];
            
            UILabel *agreeLable = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(waitLable.frame)+5, WIDTH-40, 16)];
            agreeLable.font = [UIFont systemFontOfSize:12];
            agreeLable.textColor = kColorFromARGBHex(0x000000,0.76);
            NSMutableAttributedString *agreeAttributedStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"如果商家同意：等待商家上门取货"]];
            [agreeAttributedStr addAttribute:NSForegroundColorAttributeName value:kColorFromARGBHex(0x000000,0.56) range:NSMakeRange(7, 8)];
            agreeLable.attributedText = agreeAttributedStr;
            [cell.contentView addSubview:agreeLable];
            
            UILabel *refuseLable = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(agreeLable.frame)+5, 204, 16)];
            refuseLable.font = [UIFont systemFontOfSize:12];
            refuseLable.textColor = kColorFromARGBHex(0x000000,0.76);
            NSMutableAttributedString *refuseAttributedStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"如果商家拒绝：请联系小依休客服投诉"]];
            [refuseAttributedStr addAttribute:NSForegroundColorAttributeName value:kColorFromARGBHex(0x000000,0.56) range:NSMakeRange(7, 10)];
            refuseLable.attributedText = refuseAttributedStr;
            [cell.contentView addSubview:refuseLable];
            
            UIButton *phoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(refuseLable.frame)+5, CGRectGetMaxY(agreeLable.frame)+5, 120, 16)];
            phoneBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [phoneBtn setTitle:@"4001234567" forState:UIControlStateNormal];
            [phoneBtn setTitleColor:AppThemeColor forState:UIControlStateNormal];
            [phoneBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; //文字居左显示
            [phoneBtn addTarget:self action:@selector(serviceCall:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:phoneBtn];
            
            UILabel *unHandleLable = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(refuseLable.frame)+5, WIDTH-40, 16)];
            unHandleLable.font = [UIFont systemFontOfSize:12];
            unHandleLable.textColor = kColorFromARGBHex(0x000000,0.76);
            NSMutableAttributedString *unHandleAttributedStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"如果商家未处理：超过24小时则申请达成并为你退款"]];
            [unHandleAttributedStr addAttribute:NSForegroundColorAttributeName value:kColorFromARGBHex(0x000000,0.56) range:NSMakeRange(8, 15)];
            unHandleLable.attributedText = unHandleAttributedStr;
            [cell.contentView addSubview:unHandleLable];
            
            //分割线
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 114, WIDTH, 1.0)];
            line.backgroundColor = kColorFromRGBHex(0xECECEC);
            [cell.contentView addSubview:line];
            
            UIView *goodsItemView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), WIDTH, 66)];
            [cell.contentView addSubview:goodsItemView];
            
            UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 5, 56, 56)];
            headImg.image = [UIImage imageNamed:_goodsModel.icon];
            [goodsItemView addSubview:headImg];
            
            UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImg.frame)+20, 8, 150, 20)];
            nameLab.text = _goodsModel.name;
            nameLab.font = [UIFont systemFontOfSize:14];
            nameLab.textColor = kColorFromARGBHex(0x000000,0.56);
            [goodsItemView addSubview:nameLab];
            
            UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-120, 8, 40, 20)];
            countLab.text = [NSString stringWithFormat:@"x%@",_goodsModel.count];
            countLab.textAlignment = NSTextAlignmentRight;
            countLab.font = [UIFont systemFontOfSize:14];
            countLab.textColor = kColorFromARGBHex(0x000000,0.56);
            [goodsItemView addSubview:countLab];
            
            UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-76, 8, 60, 20)];
            priceLab.text = [NSString stringWithFormat:@"￥%@",_goodsModel.price];
            priceLab.textAlignment = NSTextAlignmentRight;
            priceLab.font = [UIFont systemFontOfSize:14];
            priceLab.textColor = kColorFromARGBHex(0x000000,0.56);
            [goodsItemView addSubview:priceLab];
        }
            break;
        case 2:
        {
            UILabel *refundMoney = [[UILabel alloc] initWithFrame:CGRectMake(16, 14, WIDTH-50, 16)];
            refundMoney.text = @"退款金额";
            refundMoney.font = [UIFont systemFontOfSize:16];
            refundMoney.textColor = kColorFromARGBHex(0x000000,0.76);
            [cell.contentView addSubview:refundMoney];
            
            //分割线
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, 1.0)];
            line.backgroundColor = kColorFromRGBHex(0xECECEC);
            [cell.contentView addSubview:line];
            
            UILabel *moneyLable = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(line.frame)+17, WIDTH-50, 16)];
            moneyLable.text = [NSString stringWithFormat:@"￥%@",_goodsModel.price];
            moneyLable.font = [UIFont systemFontOfSize:16];
            moneyLable.textColor = kColorFromARGBHex(0x000000,0.36);
            [cell.contentView addSubview:moneyLable];
        }
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - event response

//拨打商店电话
- (void)shopCall {
    NSLog(@"拨打商店电话");
    [[UtilTools getCurrentVC].view addSubview:[UtilTools call:_orderModel.shopPhone]];
}

//拨打小依休客服电话
- (void)serviceCall:(UIButton *)btn {
    NSLog(@"拨打小依休客服电话");
    [[UtilTools getCurrentVC].view addSubview:[UtilTools call:btn.titleLabel.text]];
}

//提交申请
- (void)submit {
    NSLog(@"提交申请");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
