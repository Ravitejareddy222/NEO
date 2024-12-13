//
//  MyCartViewController.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartViewController.h"
#import "MyCartTableViewCell.h"

@interface MyCartViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MyCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[MyCartViewModel alloc] init];
    self.viewModel.myCartProtocol = [[MyCartServices alloc] init];
    [self setUpTableView];
    self.viewModel.myCartDetailsFetchSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView reloadData];
            //loadLayoutIfNeed;
            });
    };
    [self fetchData];
    
}

-(void) setUpTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"MyCartTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MyCartTableViewCell"];
}

-(void) fetchData{
    [_viewModel getCartList];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyCartTableViewCell *cell = (MyCartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCartTableViewCell"];
    MyCartData  *data = _viewModel.myCartData[indexPath.row];
    [cell configure:data];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.myCartData.count;
}

@end
