//
//  MenuViewController.h
//  NEO
//
//  Created by Neo on 12/12/24.
//

#import <UIKit/UIKit.h>
#import "ProductListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *menuTitles;
@property (nonatomic, strong) NSArray *menuImages;

@end

NS_ASSUME_NONNULL_END
