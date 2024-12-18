//
//  HomeViewController.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "HomeViewController.h"
#import "CategoryCollectionViewCell.h"
#import "ProductListViewController.h"
#import "MenuViewController.h"
#import <SideMenu/SideMenu-Swift.h>

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCell];
    [self setupMenu];
    [self setupNavigationBar];
    self.categoryList = @[@"Tables", @"Sofas", @"Chairs", @"Cupboards"];
}

- (void)setupMenu {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MenuViewController *sideMenuVC = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
        SideMenuNavigationController *menu = [[SideMenuNavigationController alloc] init];
        menu.viewControllers = @[sideMenuVC];
        menu.leftSide = YES;
        menu.view.backgroundColor = [UIColor blackColor];
        [SideMenuManager.defaultManager setLeftMenuNavigationController:menu];
        
}

- (void)setupNavigationBar {
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"line.horizontal.3"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(openMenu)];
    self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)openMenu {
    [self presentViewController:SideMenuManager.defaultManager.leftMenuNavigationController animated:YES completion:nil];
}


-(void) setUpCell{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemWidth = (screenWidth - 30) / 2;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    CGRect collectionViewFrame = CGRectMake(0, 380, screenWidth, self.view.bounds.size.height - 380);
    self.collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = (CategoryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    [cell configure: indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
    vc.categoryType = indexPath.item + 1;
    vc.listTitle = _categoryList[indexPath.item];
    [self.navigationController pushViewController:vc animated:true];
}

@end
