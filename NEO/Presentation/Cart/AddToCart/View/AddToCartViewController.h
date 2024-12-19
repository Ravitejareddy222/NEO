//
//  AddToCartViewController.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <UIKit/UIKit.h>
#import "AddToCartViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddToCartViewController : UIViewController

@property (nonatomic, assign) NSNumber *productId;
@property (strong, nonatomic) IBOutlet UITextField *quantityTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) AddToCartViewModel *viewModel;

@property (strong, nonatomic) IBOutlet UILabel *productNameLbl;
@property (strong, nonatomic) IBOutlet UIImageView *prodtImage;


- (IBAction)submitButtonTapped:(id)sender;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productImage;

@end

NS_ASSUME_NONNULL_END
