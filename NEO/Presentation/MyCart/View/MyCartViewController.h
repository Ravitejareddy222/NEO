//
//  MyCartViewController.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>
#import "MyCartViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCartViewController : UIViewController
 @property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong)  MyCartViewModel *viewModel;
 
@end

NS_ASSUME_NONNULL_END
