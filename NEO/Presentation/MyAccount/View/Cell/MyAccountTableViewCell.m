//
//  MyAccountTableViewCell.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountTableViewCell.h"
#import "TextFieldExtension.h"
#import "Loader.h"


@implementation MyAccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _viewModel = [[MyAccountViewModel alloc] init];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editProfileButtonTapped:(id)sender {
    if(_submitButtonVisible){
        [self setTextFieldInteraction: NO];
        [self saveDetails];
        [self.delegate editProfileButtonTapped: NO];
        [self.editProfileButton setTitle:@"EDIT PROFILE"forState:UIControlStateNormal];
        
    } else{
        _submitButtonVisible = YES;
        [self setTextFieldInteraction: YES];
        
        [self.delegate editProfileButtonTapped: YES];
        [self.editProfileButton setTitle:@"SUBMIT"forState:UIControlStateNormal];
    }
}

- (void)setUpUI{
    self.submitButtonVisible = NO;
    UIImage *personImage = [UIImage systemImageNamed:@"person.fill"];
    if (personImage){
        [TextFieldExtension addLeftIconImageToTextField:self.firstNameTextField image:personImage placeholderText:@"First Name"];
        [TextFieldExtension addLeftIconImageToTextField:self.lastNameTextField image:personImage placeholderText:@"Last Name"];
    }
    
    UIImage *email = [UIImage imageNamed:@"email_icon"];
    if (email){
        [TextFieldExtension addLeftIconImageToTextField: self.emailTextField image:email placeholderText:@"Email"];
    }
    
    UIImage *password = [UIImage imageNamed:@"dob_icon"];
    if(password){
        [TextFieldExtension addLeftIconImageToTextField: self.dateOfBirthTextField image:password placeholderText:@"DOB"];
        [TextFieldExtension addLeftIconImageToTextField:self.dateOfBirthTextField image:password placeholderText:@"DOB"];
    }
    
    UIImage *phoneNumber = [UIImage imageNamed:@"cellphone_icon"];
    if(phoneNumber){
        [TextFieldExtension addLeftIconImageToTextField: self.phoneNumberTextField image:phoneNumber placeholderText:@"Phone Number"];
    }
}

-(void) configure: (AccountData *)data{
    [self setTextFieldInteraction: NO];
    _firstNameTextField.text = data.firstName;
    _lastNameTextField.text = data.lastName;
    _emailTextField.text = data.email;
    _phoneNumberTextField.text = data.phoneNo;
    
    if (data.dob && ![data.dob isKindOfClass:[NSNull class]]){
            _dateOfBirthTextField.text = data.dob;
        } else {
            _dateOfBirthTextField.text = @"";
        }
}

-(void) setTextFieldInteraction: (BOOL) status{
    _firstNameTextField.userInteractionEnabled = status;
    _lastNameTextField.userInteractionEnabled = status;
    _emailTextField.userInteractionEnabled = status;
    _phoneNumberTextField.userInteractionEnabled = status;
    _dateOfBirthTextField.userInteractionEnabled = status;
}

- (void)saveDetails {
   NSString *firstName =  _firstNameTextField.text;
    NSString *lastName =  _lastNameTextField.text;
    NSString *email =  _emailTextField.text;
    NSString *phoneNumber =  _phoneNumberTextField.text;
    NSString *dob =  _dateOfBirthTextField.text;
    NSString *personImage = [NSString stringWithFormat:@"%@", _personImage.image];
    
    [self.delegate submitButtonTapped: firstName lastName:lastName  email: email phoneNumber: phoneNumber dob: dob personImage:personImage];
}

@end
