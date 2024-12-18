//
//  OrderListTableViewCell.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>
#import "OrdersListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *orderID;
@property (strong, nonatomic) IBOutlet UILabel *orderDate;
@property (strong, nonatomic) IBOutlet UILabel *orderTotal;

-(void) configure: (OrdersListData *)data;

@end

NS_ASSUME_NONNULL_END
