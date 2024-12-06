//
//  RegisterViewController.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <UIKit/UIKit.h>
#import "RegisterViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *registerTableView;
@property (nonatomic, strong) RegisterViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END

