//
//  RegisterViewController.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterViewController.h"
#import "RegisterViewCell.h"
#import "TextFieldExtension.h"

@interface RegisterViewController () <UITableViewDelegate, UITableViewDataSource, RegisterViewCellDelegate>
@end

@implementation RegisterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[RegisterViewModel alloc] init];
    self.viewModel.registerProtocol = [[RegisterServices alloc] init];
    self.registerTableView.delegate = self;
    self.registerTableView.dataSource = self;
    self.registerTableView.rowHeight = UITableViewAutomaticDimension;
    UINib *nib = [UINib nibWithNibName:@"RegisterViewCell" bundle:nil];
    [self.registerTableView registerNib:nib forCellReuseIdentifier:@"RegisterViewCell"];
    
    self.viewModel.registerDetailFetchSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
    };

    self.viewModel.registerDetailFetchFailure = ^(NSString *errorMessage){
        NSLog(@"Registration Failed: %@", errorMessage);
    };
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RegisterViewCell *cell = (RegisterViewCell *)[ tableView dequeueReusableCellWithIdentifier: @"RegisterViewCell" forIndexPath:indexPath];
    [cell setUpUi];
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


- (void)registerButtonTapped:(nonnull NSString *)firstname lastname:(nonnull NSString *)lastname email:(nonnull NSString *)email password:(nonnull NSString *)password confirmPassword:(nonnull NSString *)confirmPassword phoneNumber:(nonnull NSString *)phoneNumber gender:(nonnull NSString *)gender {
    
    NSLog(@"%@ %@ %@ %@ %@ %@ ", firstname, lastname, email, phoneNumber, gender, password);
    
    [_viewModel saveUser:firstname lastname:lastname email:email password:password confirmPassword:confirmPassword phoneNumber:phoneNumber gender:gender];
}

@end

