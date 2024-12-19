//
//  OrderDetailsViewController.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrderDetailsViewController.h"
#import "OrderDetailTableViewCell.h"
#import "ButtonViewCell.h"
#import "Loader.h"

@interface OrderDetailsViewController () <UITableViewDelegate, UITableViewDataSource>
   @property (nonatomic, strong) NSArray<NSString *> *cellIdentifiers;
@end

@implementation OrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[OrderDetailsViewModel alloc] init];
    self.viewModel.orderDetailsProtocol = [[OrderDetailsServices alloc] init];
    [self setUpTableView];
    [Loader setUpLoaderInView:self.view];
    [Loader showLoaderInView:self.view];
    self.viewModel.orderDetailsFetchSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView reloadData];
            [Loader hideLoaderInView:self.view];
            });
    };
    [self fetchData];
}

-(void) setUpTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   self.cellIdentifiers = @[@"OrderDetailTableViewCell", @"ButtonViewCell"];
    for (NSString *cell in self.cellIdentifiers){
        UINib *nib = [UINib nibWithNibName:cell  bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:cell];
    }
}

-(void) fetchData{
    [_viewModel orderDetails: _orderId];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *identifier = self.cellIdentifiers[indexPath.section];

    if ([identifier  isEqualToString:@"OrderDetailTableViewCell"]){
        OrderDetailTableViewCell *cell = (OrderDetailTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"OrderDetailTableViewCell"];
        ItemDetails  *data = _viewModel.itemDetails[indexPath.row];
        [cell configure: data];
        return cell;
    } else if ([identifier isEqualToString:@"ButtonViewCell"]){
        ButtonViewCell *cell = (ButtonViewCell *)[tableView dequeueReusableCellWithIdentifier: @"ButtonViewCell"];
        NSNumber *cost = _viewModel.order.cost;
        [cell configureForOrderDetails: cost];
        return cell;
    }
    
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section){
        case 0:
            return _viewModel.itemDetails.count;
        case 1:
            return 1;
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _cellIdentifiers.count;
}
@end
