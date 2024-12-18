//
//  ProductListViewController.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <UIKit/UIKit.h>
#import "ProductListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductListViewController : UIViewController

@property (nonatomic, assign) NSInteger categoryType;
@property (nonatomic, copy) NSString *listTitle;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ProductListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
