//
//  ProductDetailsViewController.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <UIKit/UIKit.h>
#import "ProductDetailsViewModel.h"
#import "ProductImagesViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *productCategory;
@property (strong, nonatomic) IBOutlet UILabel *productProducer;
@property (strong, nonatomic) IBOutlet UILabel *productCost;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UICollectionView *productCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *buyNowButton;
@property (strong, nonatomic) IBOutlet UIButton *rateNowButton;

- (IBAction)buynowButtonTapped:(id)sender;
- (IBAction)ratenowButtonTapped:(id)sender;

@property (nonatomic, assign) long productId;
@property (nonatomic, strong) ProductDetailsViewModel *viewModel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) long selectedIndex;


@end

NS_ASSUME_NONNULL_END
