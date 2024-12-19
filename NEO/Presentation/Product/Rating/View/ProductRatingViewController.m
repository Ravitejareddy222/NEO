//
//  ProductRatingViewController.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ProductRatingViewController.h"
#import "RatingCollectionViewCell.h"
#import "UIViewController+Title.h"
#import <SDWebImage/SDWebImage.h>

@interface ProductRatingViewController ()< UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ProductRatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[RatingViewModel alloc] init];
    self.viewModel.ratingsProtocol = [[RatingsServices alloc] init];
    
    NSString *imageUrlString = _productImage;
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
        
        [_prodImage sd_setImageWithURL:imageUrl
                          placeholderImage:[UIImage imageNamed:@"placeholder"]
                                   options:SDWebImageRefreshCached
                                   completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            if (error) {
                NSLog(@"Error loading image: %@", error.localizedDescription);
            }
        }];
    _productNameLabel.text = _productName;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"RatingCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"RatingCollectionViewCell"];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopup)];
        [backgroundView addGestureRecognizer:tapGesture];
        [self.view addSubview:backgroundView];
        [self.view sendSubviewToBack:backgroundView];
    self.viewModel.ratingsSaveSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showAlert:@"Thank You" mesaage:@"Your ratings saved Successfully"];
        });
    };
}

- (void)dismissPopup {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)rateNowBtnTapped:(id)sender {
    [_viewModel rateProduct: _setRating productId:_productId];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RatingCollectionViewCell *cell = (RatingCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"RatingCollectionViewCell" forIndexPath:indexPath];
   
    if(_setRating.intValue > indexPath.row){
        [cell configure: YES color:NO];
    }else{
        [cell configure: NO color:NO];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *index = @(indexPath.row + 1);
    _setRating = index;
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(46, 46);
}

@end
