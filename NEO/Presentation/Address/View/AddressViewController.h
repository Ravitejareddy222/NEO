//
//  AddressViewController.h
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import <UIKit/UIKit.h>
#import "PlaceOrderViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressViewController : UIViewController
  
- (void)addAddressButtonTapped;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *addressListArray;
@property (nonatomic, strong) PlaceOrderViewModel *viewModel;
@property (nonatomic, strong) NSString *selectedAddress;

-(void) footerButtonTapped;
@end

NS_ASSUME_NONNULL_END
