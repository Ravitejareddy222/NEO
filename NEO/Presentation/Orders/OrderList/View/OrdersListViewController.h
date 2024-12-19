//
//  OrdersListViewController.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <UIKit/UIKit.h>
#import "OrdersListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrdersListViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong)  OrdersListViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
