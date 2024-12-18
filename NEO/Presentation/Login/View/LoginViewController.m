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
#import "Storage.h"
#import "Loader.h"
#import "UIViewController+Title.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginViewModel = [[LoginViewModel alloc] init];
    self.loginViewModel.loginProtocol = [[LoginServices alloc] init];
    
    self.forgotPasswordViewModel = [[ForgotPasswordViewModel alloc] init];
    self.forgotPasswordViewModel.forgotPasswordProtocol = [[ForgotPasswordServices alloc] init];
    
    [self setUpUI];
    [self manageObservers];
}

- (void) setUpUI{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backButtonTitle = nil;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIImage *personImage = [UIImage systemImageNamed:@"person.fill"];
    if (personImage) { [TextFieldExtension addLeftIconImageToTextField:self.username image:personImage placeholderText:@"Username"]; }
    
    UIImage *passwordImage = [UIImage systemImageNamed:@"lock.fill"];
    if (passwordImage) { [TextFieldExtension addLeftIconImageToTextField:self.password image:passwordImage placeholderText:@"Password"]; }
}

-(void) manageObservers{
    self.loginViewModel.onStartLoading = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
                [Loader setUpLoaderInView:self.view];
                [Loader showLoaderInView:self.view];
            });
    };
    
    self.loginViewModel.loginDetailsFetchSuccessfull = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loader hideLoaderInView:self.view];
            HomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            NSString *accessToken = self.loginViewModel.loginData.accessToken;
            [Storage setAccessToken: accessToken];
            [self.navigationController pushViewController: vc animated:true];
        });
    };
    
    self.loginViewModel.loginDetailsFetchFailure = ^(NSString *errorMessage){
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loader hideLoaderInView:self.view];
            [self showAlert:@"Error" mesaage:@"Invalid Credentials"];
        });
        
    };
}


- (IBAction)registerButtonTapped:(id)sender {
    RegisterViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController: vc animated:true];
}

- (IBAction)loginButtonTapped:(id)sender {
    if (_forgotPasswordHidden == NO){
        NSString * username = self.username.text;
        NSString * password = self.password.text;
        [_loginViewModel saveLogin: username password: password];
    } else{
        NSString *email = _username.text;
        self.forgotPasswordViewModel.onStartLoading = ^{
            [Loader setUpLoaderInView:self.view];
            [Loader showLoaderInView:self.view];
        };
        
        self.forgotPasswordViewModel.saveForgotPasswordDetailsSuccessful = ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [Loader hideLoaderInView:self.view];
            });
        };
        
        self.forgotPasswordViewModel.saveForgotPasswordDetailsFailure =^(NSString *errorMessage){
            dispatch_async(dispatch_get_main_queue(), ^{
                [Loader hideLoaderInView:self.view];
                [self showAlert:@"Error" mesaage:@"invalid credentials"];
            });
        };
        [_forgotPasswordViewModel forgotPassword:email];
    }
}

- (IBAction)ForgotPasswordTapped:(id)sender {
    [_password setHidden:YES];
    [_ForgotPasswordButton setHidden:YES];
    [_registerButton setHidden:YES];
    [_accountLabel setHidden:YES];
    [_loginButton setTitle:@"SUBMIT" forState: UIControlStateNormal];
    _forgotPasswordHidden = YES;
    _username.text = @"";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"chevron.left"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(backButtonTapped)];
    
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
}

-(void) backButtonTapped{
    [_password setHidden:NO];
    [_ForgotPasswordButton setHidden:NO];
    [_registerButton setHidden:NO];
    [_accountLabel setHidden:NO];
    [_loginButton setTitle:@"LOGIN" forState: UIControlStateNormal];
    _forgotPasswordHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    _forgotPasswordHidden = NO;
    _username.text = @"";
}


@end

