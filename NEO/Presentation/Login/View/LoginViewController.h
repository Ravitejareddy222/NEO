//
//  ViewController.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <UIKit/UIKit.h>
#import "TextFieldExtension.h"
#import "LoginViewModel.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) IBOutlet UIButton *ForgotPasswordButton;


- (IBAction)loginButtonTapped:(id)sender;
- (IBAction)registerButtonTapped:(id)sender;
- (IBAction)ForgotPasswordTapped:(id)sender;

@property (strong, nonatomic) LoginViewModel *loginViewModel;

@end
