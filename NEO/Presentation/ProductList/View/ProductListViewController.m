//
//  ProductListViewController.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListViewController.h"
#import "ProductListTableViewCell.h"

@interface ProductListViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"ProductListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ProductListTableViewCell"];
    [_viewModel getProductList: _categoryType];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProductListTableViewCell *cell = (ProductListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell" forIndexPath:indexPath];
    
    return cell;
}




@end
