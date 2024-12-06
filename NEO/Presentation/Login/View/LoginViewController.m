//
//  ViewController.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgotViewController.h"
#import "TextFieldExtension.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *personImage = [UIImage systemImageNamed:@"person.fill"];
    if (personImage) { [TextFieldExtension addLeftIconImageToTextField:self.username image:personImage placeholderText:@"Username"]; }
    
    UIImage *passwordImage = [UIImage systemImageNamed:@"lock.fill"];
    if (passwordImage) { [TextFieldExtension addLeftIconImageToTextField:self.password image:passwordImage placeholderText:@"Password"]; }
}

- (IBAction)registerButtonTapped:(id)sender {
    RegisterViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController: vc animated:true];
}

- (IBAction)loginButtonTapped:(id)sender {
    
}

- (IBAction)ForgotPasswordTapped:(id)sender {
    ForgotViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotViewController"];
    [self.navigationController pushViewController:vc animated:true];

}
@end

