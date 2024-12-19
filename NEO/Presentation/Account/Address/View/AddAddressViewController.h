//
//  AddAddressViewController.h
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddAddressViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *addressTextView;

@property (strong, nonatomic) IBOutlet UITextField *landmark;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *zipCode;
@property (strong, nonatomic) IBOutlet UITextField *country;
@property (strong, nonatomic) IBOutlet UIButton *saveAddressBtn;

- (IBAction)saveAddressBtnTapped:(id)sender;



@end

NS_ASSUME_NONNULL_END
