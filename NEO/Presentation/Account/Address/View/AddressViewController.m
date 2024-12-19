//
//  AddressViewController.m
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import "AddressViewController.h"
#import "AddressViewCell.h"
#import "AddAddressViewController.h"
#import "Storage.h"

@interface AddressViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[PlaceOrderViewModel alloc] init];
    self.viewModel.placeOrderProtocol = [[PlaceOrderServices alloc] init];
    self.viewModel.placeOrderDetailsFetchSuccessful = ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert Title"
                                                                           message:@"This is a simple alert message."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
    };
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"AddressViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"AddressViewCell"];
    [self setupNavigationBarButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    _addressListArray = [Storage getAddressList];
    _tableView.reloadData;
}

- (void)setupNavigationBarButton {
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self
                                                              action:@selector(addAddressButtonTapped)];
        
        rightBarButton.tintColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)addAddressButtonTapped {
    AddAddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddAddressViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AddressViewCell *cell = (AddressViewCell *) [tableView dequeueReusableCellWithIdentifier:@"AddressViewCell"];
    NSString *address = _addressListArray[indexPath.row];
    [cell configure: address];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _addressListArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedAddress = _addressListArray[indexPath.row];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 4, self.view.frame.size.width - 30, 30)];
    label.text = @"Shipping Address";
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:label];
    
    return headerView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];

    UIButton *footerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    footerButton.frame = CGRectMake(20, 0, self.view.frame.size.width - 30, 40);
    [footerButton setTitle:@"PLACE ORDER" forState:UIControlStateNormal];
    footerButton.backgroundColor = [UIColor colorNamed:@"primaryColor"];
    [footerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footerButton addTarget:self action:@selector(footerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:footerButton];
    
    return footerView;
}

-(void) footerButtonTapped{
    [_viewModel placeOrder: _selectedAddress];
}



@end
