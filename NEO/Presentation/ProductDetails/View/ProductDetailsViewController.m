//
//  ProductDetailsViewController.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailsViewController.h"
#import "AddToCartViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "ProductRatingViewController.h"


@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"ProductImagesViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ProductImagesViewCell"];
    
    _viewModel = [[ProductDetailsViewModel alloc] init];
    self.viewModel.productDetailsProtocol = [[ProductDetailServices alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    self.viewModel.getProductDetailsSuccessfull = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUpUi];
            [self.collectionView reloadData];
        });
    };
    [_viewModel getProductDetails: _productId];
}

-(void) setUpUi{
    _productName.text = self.viewModel.productDetails.productName;
    NSNumber *productCategoryId = self.viewModel.productDetails.productCategoryId;
    NSString *productCategory = [self.viewModel getProductCategory:productCategoryId];
    _productCategory.text = productCategory;
    _productProducer.text = self.viewModel.productDetails.productproducer;
    NSNumber *costValue = self.viewModel.productDetails.productCost;
    NSString *cost = [costValue stringValue];
    _productCost.text = [NSString stringWithFormat:@"RS. %@", cost];
    _productDescriptionLabel.text = self.viewModel.productDetails.productDescription;
    
    NSString *prodImageURL = _viewModel.productDetails.productImages[0].productImage;
    [self updateProductImageViewWithURL:prodImageURL];
    
}


- (IBAction)ratenowButtonTapped:(id)sender {
    ProductRatingViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductRatingViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)buynowButtonTapped:(id)sender {
    AddToCartViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddToCartViewController"];
    vc.productId = self.viewModel.productDetails.productId;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProductImagesViewCell *cell = (ProductImagesViewCell *)[ collectionView dequeueReusableCellWithReuseIdentifier:@"ProductImagesViewCell" forIndexPath:indexPath
    ];
    NSString *prodImage = _viewModel.productDetails.productImages[indexPath.row].productImage;
    [cell configure: prodImage];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _viewModel.productDetails.productImages.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    NSString *prodImageURL = _viewModel.productDetails.productImages[indexPath.row].productImage;
    [self updateProductImageViewWithURL:prodImageURL];
    
}

- (void)updateProductImageViewWithURL:(NSString *)imageURL {
    NSURL *url = [NSURL URLWithString:imageURL];
    [self.productImage sd_setImageWithURL:url
                         placeholderImage:[UIImage imageNamed:@"placeholder"]
                                  options:SDWebImageHighPriority
                                completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            NSLog(@"Error loading image: %@", error.localizedDescription);
        }
    }];
}



@end
