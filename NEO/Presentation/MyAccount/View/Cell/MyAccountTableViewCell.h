//
//  MyAccountTableViewCell.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <UIKit/UIKit.h>
#import "MyAccountModel.h"
#import "MyAccountViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MyAccountTableViewCellDelegate <NSObject>

-(void) editProfileButtonTapped: (BOOL)visible;
-(void) submitButtonTapped: (NSString *)firstName lastName:(NSString *)lastName  email: (NSString *) email phoneNumber: (NSString *)phoneNumber dob: (NSString *)dob personImage: (NSString *)personImage;

@end

@interface MyAccountTableViewCell : UITableViewCell
@property (strong, nullable, nonatomic) IBOutlet UIImageView *personImage;
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (strong, nonatomic) IBOutlet UIButton *editProfileButton;

@property (assign, nonatomic) BOOL submitButtonVisible;

- (IBAction)editProfileButtonTapped:(id)sender;
-(void) setUpUI;
-(void) configure: (AccountData *)data;
-(void) setTextFieldInteraction: (BOOL) status;
-(void) saveDetails;

@property (nonatomic, weak) id<MyAccountTableViewCellDelegate> delegate;
@property (nonatomic, strong)  MyAccountViewModel *viewModel;



@end

NS_ASSUME_NONNULL_END
