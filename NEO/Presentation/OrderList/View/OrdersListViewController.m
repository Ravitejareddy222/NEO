//
//  OrdersListViewController.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrdersListViewController.h"
#import "OrderListTableViewCell.h"
#import "OrderDetailsViewController.h"
#import "Loader.h"

@interface OrdersListViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation OrdersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [Loader setUpLoaderInView:self.view];
    [Loader showLoaderInView:self.view];
    [self fetchData];
    
}

-(void) setUpTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"OrderListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OrderListTableViewCell"];
    
}

-(void) fetchData{
    self.viewModel = [[OrdersListViewModel alloc] init];
    self.viewModel.ordersListProtocol = [[OrdersListServices alloc] init];
    self.viewModel.ordersListDetailsFetchSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView reloadData];
            [Loader hideLoaderInView:self.view];
            });
    };
    [_viewModel ordersList];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    OrderListTableViewCell *cell = (OrderListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"OrderListTableViewCell"];
    OrdersListData *data = _viewModel.ordersListData[indexPath.row];
    [cell configure: data];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.ordersListData.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailsViewController"];
    vc.orderId = _viewModel.ordersListData[indexPath.row].productId;
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
