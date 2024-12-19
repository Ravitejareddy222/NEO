//
//  MyAccountViewController.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <UIKit/UIKit.h>
#import "MyAccountViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyAccountViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *resetButton;


@property (nonatomic, strong) IBOutlet UITableView *tableView;

- (IBAction)resetPasswordButtonTapped:(id)sender;

@property (nonatomic, strong)  MyAccountViewModel *viewModel;


@end

NS_ASSUME_NONNULL_END
