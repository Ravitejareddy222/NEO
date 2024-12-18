//
//  MyCartViewController.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartViewController.h"
#import "MyCartTableViewCell.h"
#import "ButtonViewCell.h"
#import "AddressViewController.h"
#import "Loader.h"

@interface MyCartViewController ()<UITableViewDelegate, UITableViewDataSource, ButtonViewCellDelegate, MyCartTableViewCellDelegate>
@property (nonatomic, strong) NSArray<NSString *> *cellIdentifiers;

@end

@implementation MyCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[MyCartViewModel alloc] init];
    _deleteEditViewModel = [[DeleteAndEditCartViewModel alloc] init];
    
    self.viewModel.myCartProtocol = [[MyCartServices alloc] init];
    self.deleteEditViewModel.deleteEditProtocol = [[DeleteAndEditCartServices alloc] init];
    
    [self setUpTableView];
    [Loader setUpLoaderInView:self.view];
    [Loader showLoaderInView:self.view];
    self.viewModel.myCartDetailsFetchSuccessful = ^{
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
    self.cellIdentifiers = @[@"MyCartTableViewCell", @"ButtonViewCell"];
    for (NSString *cellIdentifier in self.cellIdentifiers) {
        UINib *nib = [UINib nibWithNibName:cellIdentifier bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    }
}

-(void) fetchData{
    [_viewModel getCartList];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *identifier = _cellIdentifiers[indexPath.section];
    
    if ([identifier isEqualToString:@"MyCartTableViewCell"]) {
        MyCartTableViewCell *cell = (MyCartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCartTableViewCell" forIndexPath:indexPath];
        MyCartData *data = _viewModel.myCartData[indexPath.row];
        [cell configure:data];
        cell.delegate = self;
        return cell;
    } else if ([identifier isEqualToString:@"ButtonViewCell"]) {
        ButtonViewCell *cell = (ButtonViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ButtonViewCell" forIndexPath:indexPath];
        cell.delegate = self;
//        NSNumber *cost = _viewModel.myCartData;
//        [cell configureForTotalCost: cost];
        return cell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"];
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section){
        case 0:
            return _viewModel.myCartData.count;
        case 1:
            return 1;
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _cellIdentifiers.count;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive
                                                             title:nil
                                                           handler:^(UIContextualAction * _Nonnull action,
                                                            UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [self deleteItemAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        completionHandler(YES);
    }];
    
    UIImage *deleteImage = [UIImage imageNamed:@"delete"];
    UIImage *resizedImage = [self resizedImage:deleteImage toSize:CGSizeMake(55, 55)];
    deleteAction.image = resizedImage;
    
    deleteAction.backgroundColor = [UIColor whiteColor];
    
    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction]];
    
    return configuration;
}


- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath {
    // Get the productId before removing the item from the data source
    NSNumber *productId = self.viewModel.myCartData[indexPath.row].productId;

    // Update the data source
    NSMutableArray *mutableCartData = [self.viewModel.myCartData mutableCopy];
    [mutableCartData removeObjectAtIndex:indexPath.row];
    self.viewModel.myCartData = [mutableCartData copy];
    
    // Now delete the row in the table view
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    
    // Call deleteCart with the correct productId
    [self.deleteEditViewModel deleteCart:productId];
}



- (UIImage *)resizedImage:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, image.scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}


- (void)orderBtnTapped {
    AddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddressViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didQuantityChange:(NSInteger)quantity atIndex:(NSInteger)index {
    NSNumber *productId = _viewModel.myCartData[index].productId;
    NSNumber *quantityNumber = @(quantity);
    self.deleteEditViewModel.editCartSuccessful = ^{
        
    };
    [_deleteEditViewModel editCart: productId quantity: quantityNumber];
}

@end
