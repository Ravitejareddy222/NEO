//
//  ResetPasswordViewController.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <UIKit/UIKit.h>
#import "ResetPasswordViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResetPasswordViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *currentTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTxtField;

@property (strong, nonatomic) IBOutlet UIButton *resetPasswordButton;
- (IBAction)resetPasswordButtonTapped:(id)sender;

@property (nonatomic, strong) ResetPasswordViewModel *viewModel;


-(void) setUpUI;
@end

NS_ASSUME_NONNULL_END
