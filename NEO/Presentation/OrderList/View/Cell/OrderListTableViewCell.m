//
//  OrderListTableViewCell.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "OrderListTableViewCell.h"

@implementation OrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(nonnull OrdersListData *)data {
   
    NSNumber * prodId = data.productId;
    _orderID.text = [NSString stringWithFormat:@"Order ID %@", prodId];
    _orderDate.text = [NSString stringWithFormat:@"Ordered Date %@", data.created];
    NSNumber * cost = data.productId;
    _orderTotal.text = [NSString stringWithFormat:@"₹ %@", cost];
}

@end
