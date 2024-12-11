//
//  HomeViewController.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "HomeViewController.h"
#import "CategoryCollectionViewCell.h"
#import "ProductListViewController.h"

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCell];
    
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
    [self.navigationController pushViewController:vc animated:true];
}




@end
