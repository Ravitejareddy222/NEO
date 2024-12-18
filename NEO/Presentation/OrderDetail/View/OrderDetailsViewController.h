//
//  OrderDetailsViewController.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <UIKit/UIKit.h>
#import "OrderDetailsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailsViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong)  OrderDetailsViewModel *viewModel;
@property (nonatomic, strong) NSArray<OrderDetails *> *order;
@property (nonatomic, strong) NSArray<ItemDetails *> *orderDetail;


@property (nonatomic, strong) NSNumber *orderId;


@end

NS_ASSUME_NONNULL_END
