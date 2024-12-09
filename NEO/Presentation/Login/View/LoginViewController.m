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
#import "LoginViewModel.h"
#import "HomeViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginViewModel = [[LoginViewModel alloc] init];
    [self setUpUI];
    [self manageObservers];
}

- (void) setUpUI{
    UIImage *personImage = [UIImage systemImageNamed:@"person.fill"];
    if (personImage) { [TextFieldExtension addLeftIconImageToTextField:self.username image:personImage placeholderText:@"Username"]; }
    
    UIImage *passwordImage = [UIImage systemImageNamed:@"lock.fill"];
    if (passwordImage) { [TextFieldExtension addLeftIconImageToTextField:self.password image:passwordImage placeholderText:@"Password"]; }
}

-(void) manageObservers{
    self.loginViewModel.loginDetailsFetchSuccessfull = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            [self.navigationController pushViewController: vc animated:true];
            });
    };
    
    self.loginViewModel.loginDetailsFetchFailure = ^(NSString *errorMessage){
        NSLog(@"Login Failed: %@", errorMessage);
    };
}


- (IBAction)registerButtonTapped:(id)sender {
    RegisterViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController: vc animated:true];
}

- (IBAction)loginButtonTapped:(id)sender {
    NSString * username = self.username.text;
    NSString * password = self.password.text;
    [_loginViewModel saveLogin: username password: password];
}

- (IBAction)ForgotPasswordTapped:(id)sender {
    ForgotViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotViewController"];
    [self.navigationController pushViewController:vc animated:true];

}
@end

