//
//  RegisterViewCell.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterViewCell.h"
#import "TextFieldExtension.h"

@implementation RegisterViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _registerButton.layer.cornerRadius = 10;
    [self addTapGestureToView: self.maleView];
    [self addTapGestureToView:self.femaleView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
 
- (void)setUpUi{
    UIImage *personImage = [UIImage systemImageNamed:@"person.fill"];
    if (personImage){
        [TextFieldExtension addLeftIconImageToTextField:self.firstNameTextField image:personImage placeholderText:@"First Name"];
        [TextFieldExtension addLeftIconImageToTextField:self.lastNameTextField image:personImage placeholderText:@"Last Name"];
    }
    
    UIImage *email = [UIImage imageNamed:@"email_icon"];
    if (email){
        [TextFieldExtension addLeftIconImageToTextField: self.emailTextField image:email placeholderText:@"Email"];
    }
    
    UIImage *password = [UIImage imageNamed:@"password_icon"];
    if(password){
        [TextFieldExtension addLeftIconImageToTextField: self.passwordTextField image:password placeholderText:@"Password"];
        [TextFieldExtension addLeftIconImageToTextField:self.confirmPasswordTextField image:password placeholderText:@"Confirm Password"];
    }
    
    UIImage *phoneNumber = [UIImage imageNamed:@"cellphone_icon"];
    if(phoneNumber){
        [TextFieldExtension addLeftIconImageToTextField: self.phoneNumberTextField image:phoneNumber placeholderText:@"Phone Number"];
    }
}

- (void) addTapGestureToView:(UIView *) view{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGesture];
}

- (void) viewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    UIView *tappedView = gestureRecognizer.view;
    
    if(tappedView == self.maleView){
        [self changeImageForView: @"filledCircle" femaleImage:  @"emptyCircle"];
    } else{
        [self changeImageForView: @"emptyCircle" femaleImage:  @"filledCircle"];
    }
    
}

- (void)changeImageForView:(NSString *)maleName femaleImage:(NSString *)femaleName;{
        _maleImg.image = [UIImage imageNamed:maleName];
        _femaleImg.image = [UIImage imageNamed:femaleName];
    
    if ([maleName  isEqual: @"filledCircle"]){
        _gender = @"M";
    } else{
        _gender = @"F";
    }
}



- (IBAction)registerButtonTapped:(id)sender {
    NSString *firstname =  self.firstNameTextField.text;
    NSString *lastname = self.lastNameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *confirmPassword = self.confirmPasswordTextField.text;
    NSString *phoneNumber = self.phoneNumberTextField.text;
    
    [self.delegate registerButtonTapped:firstname lastname:lastname email:email password:password confirmPassword:confirmPassword phoneNumber:phoneNumber gender: _gender];
}
@end
