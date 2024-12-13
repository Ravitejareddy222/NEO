//
//  ProductDetailsViewController.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailsViewController.h"
#import "AddToCartViewController.h"

@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[ProductDetailsViewModel alloc] init];
    self.viewModel.productDetailsProtocol = [[ProductDetailServices alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    self.viewModel.getProductDetailsSuccessfull = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUpUi];
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
}


- (IBAction)ratenowButtonTapped:(id)sender {
}

- (IBAction)buynowButtonTapped:(id)sender {
    AddToCartViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddToCartViewController"];
    vc.productId = self.viewModel.productDetails.productId;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:vc animated:YES completion:nil];
}

@end
