//
//  MyAccountViewController.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountViewController.h"
#import "MyAccountTableViewCell.h"
#import "Loader.h"
#import "ResetPasswordViewController.h"

@interface MyAccountViewController ()<UITableViewDelegate, UITableViewDataSource, MyAccountTableViewCellDelegate>

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[MyAccountViewModel alloc] init];
    self.viewModel.myAccountProtocol = [[MyAccountServices alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"MyAccountTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MyAccountTableViewCell"];
    [self manageObservers];
    [_viewModel getAccountDetails];
}

-(void) manageObservers{
    self.viewModel.onStartLoading = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
        [Loader setUpLoaderInView:self.view];
        [Loader showLoaderInView:self.view];
        });
    };
    self.viewModel.myAccountDetailsFetchSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView reloadData];
            [Loader hideLoaderInView:self.view];
        });
    };
    
};

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyAccountTableViewCell *cell = (MyAccountTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyAccountTableViewCell"];
    [cell setUpUI];
    AccountData *data = self.viewModel.accountData;
    cell.delegate = self;
    [cell configure: data];
    self.viewModel.myAccountDetailsSaveSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self editProfileButtonTapped: NO];
            [cell.editProfileButton setTitle:@"EDIT PROFILE"forState:UIControlStateNormal];
        });
    };
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


-(void) editProfileButtonTapped: (BOOL)visible{
    [self.resetButton setHidden:visible];
}

- (void)submitButtonTapped:(nonnull NSString *)firstName lastName:(nonnull NSString *)lastName email:(nonnull NSString *)email phoneNumber:(nonnull NSString *)phoneNumber dob:(nonnull NSString *)dob personImage: (nonnull NSString *)personImage{
    
    self.viewModel.onStartLoading = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loader setUpLoaderInView:self.view];
            [Loader showLoaderInView:self.view];
        });
    };
    
    self.viewModel.myAccountDetailsSaveSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loader hideLoaderInView:self.view];
        });
    };
    [_viewModel saveAccountData:firstName lastName:lastName email:email dob:dob phoneNumber:phoneNumber personImage: personImage];
}


- (IBAction)resetPasswordButtonTapped:(id)sender {
    ResetPasswordViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ResetPasswordViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
