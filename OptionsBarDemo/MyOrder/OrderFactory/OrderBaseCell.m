//
//  OrderBaseCell.m
//  SuperMarket
//
//  Created by hanzhanbing on 16/7/18.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import "OrderBaseCell.h"

@implementation OrderBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addContentView];
    }
    return self;
}

- (void)addContentView {
    
}

- (void)setContentView:(OrderModel *)orderModel {
    
}

+ (NSString *)getIdentifier {
    return @"";
}

+ (CGFloat)getHeight:(OrderModel *)orderModel {
    return 0;
}

@end
