//
//  ProductListViewController.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListViewController.h"
#import "ProductListTableViewCell.h"
#import "ProductListServices.h"
#import "ProductDetailsViewController.h"

@interface ProductListViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self fetchData];
    
}

-(void) setUpTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"ProductListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ProductListTableViewCell"];
    
}

-(void) fetchData{
    self.viewModel = [[ProductListViewModel alloc] init];
    self.viewModel.productListprotocol = [[ProductListServices alloc] init];
    self.viewModel.productListFetchSuccessfull = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView reloadData];
            });
    };
    [_viewModel getProductList: _categoryType];
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.productList.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProductListTableViewCell *cell = (ProductListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell" forIndexPath:indexPath];
    ProductData *data = self.viewModel.productList[indexPath.row];
    [cell configure: data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    NSNumber *productId = self.viewModel.productList[indexPath.row].productId;
    vc.productId = productId ? productId.longValue : 0;
    [self.navigationController pushViewController:vc animated:true];
}




@end
