//
//  RegisterViewCell.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewCellDelegate <NSObject>

- (void) registerButtonTapped: (NSString *) firstname lastname: (NSString *)lastname email: (NSString *)email password: (NSString *)password confirmPassword: (NSString *) confirmPassword phoneNumber: (NSString *)phoneNumber gender: (NSString *)gender;

@end

@interface RegisterViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (strong, nonatomic) IBOutlet UIView *maleView;
@property (strong, nonatomic) IBOutlet UIView * femaleView;
@property (strong, nonatomic) IBOutlet UIImageView *maleImg;
@property (strong, nonatomic) IBOutlet UIImageView *femaleImg;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) NSString *gender;
- (IBAction)registerButtonTapped:(id)sender;

- (void) addTapGestureToView:(UIView *) view;
- (void)changeImageForView:(NSString *)maleName femaleImage:(NSString *)femaleName;
- (void)setUpUi;

@property (weak, nonatomic) id<RegisterViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
