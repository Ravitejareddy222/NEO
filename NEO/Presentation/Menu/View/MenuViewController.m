//
//  MenuViewController.m
//  NEO
//
//  Created by Neo on 12/12/24.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "ProductListViewController.h"
#import "AddToCartViewController.h"
#import "Storage.h"
#import "LoginViewController.h"
#import "OrdersListViewController.h"
#import "MyAccountViewController.h"

@interface MenuViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"MenuTableViewCell" bundle: nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MenuTableViewCell"];
    [self setupMenuData];
}

- (void)setupMenuData {
    self.menuTitles = @[@"My Cart", @"Tables", @"Sofas", @"Chairs", @"Cupboards", @"My Account", @"Store Locator", @"My Orders", @"Logout"];
    
    self.menuImages = @[@"cart", @"table_01", @"Sofa_01", @"chair", @"cupboard-icon", @"person", @"storelocator_icon", @"my-orders-icon", @"logout"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MenuTableViewCell *cell = (MenuTableViewCell *)[ tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell"];
    cell.optionsLabel.text = _menuTitles[indexPath.row];
    UIImage *image = [UIImage imageNamed:_menuImages[indexPath.row]];
    cell.optionsImage.image = image;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menuTitles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    
    switch (indexPath.row) {
        case 0:{
         vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyCartViewController"];
            break;
        }
        case 1: {
            ProductListViewController *productVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
                        productVC.categoryType = indexPath.row;
            productVC.listTitle = @"Tables";
                        vc = productVC;
            break;
        }
        case 2: {
            ProductListViewController *productVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
                        productVC.categoryType = indexPath.row;
            productVC.listTitle = @"Sofas";
                        vc = productVC;
            break;
        }
        case 3:{
            ProductListViewController *productVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
                        productVC.categoryType = indexPath.row;
                        productVC.listTitle = @"Chairs";
                        vc = productVC;
            break;
        }
        case 4:{
            ProductListViewController *productVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
                        productVC.categoryType = indexPath.row;
                        productVC.listTitle = @"Cupboards";
                        vc = productVC;
            break;
        }
        case 5:{
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyAccountViewController"];
            break;
        }
            
        case 7:{
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrdersListViewController"];
            break;
        }
            
        case 8:
        {
            [Storage removeAccessToken];
            LoginViewController *LoginVc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.navigationController pushViewController:LoginVc animated:YES];
            break;
        }
            
        default: {
            NSLog(@"Invalid selection");
            return;
        }
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
