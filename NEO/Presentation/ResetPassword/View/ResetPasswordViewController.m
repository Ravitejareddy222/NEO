//
//  ResetPasswordViewController.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ResetPasswordViewController.h"
#import "TextFieldExtension.h"
#import "UIViewController+Title.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[ResetPasswordViewModel alloc] init];
    self.viewModel.resetPasswordProtocol = [[ResetpasswordServices alloc] init];
    self.viewModel.newPasswordSaveSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showAlert:@"" mesaage:@"Password updated successfully"];
        });
    };
    [self setUpUI];
}

-(void) setUpUI{
    UIImage *password = [UIImage imageNamed:@"password_icon"];
        [TextFieldExtension addLeftIconImageToTextField: self.currentTextField image:password placeholderText:@"Current Password"];
        [TextFieldExtension addLeftIconImageToTextField: self.passwordTextField image:password placeholderText:@"New Password"];
        [TextFieldExtension addLeftIconImageToTextField:self.confirmPasswordTxtField image:password placeholderText:@"Confirm Password"];
}

- (IBAction)resetPasswordButtonTapped:(id)sender {
    NSString *currentPassword = _currentTextField.text;
    NSString *newPassword = _passwordTextField.text;
    NSString *confirmPassword = _confirmPasswordTxtField.text;
    
    if (currentPassword && newPassword && confirmPassword){
        if (newPassword == confirmPassword){
            [_viewModel setNewPassword: currentPassword newPassword: newPassword confirmPassword: confirmPassword];
        }else{
            [self showAlert:@"Error" mesaage:@"Newpassword and Confirm password are not matching"];
        }
    }else{
        [self showAlert:@"Error" mesaage:@"Enter all the required fields"];
    }
}

@end
