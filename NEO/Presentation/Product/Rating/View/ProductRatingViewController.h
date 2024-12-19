//
//  ProductRatingViewController.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <UIKit/UIKit.h>
#import "RatingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductRatingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *productNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *prodImage;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet UIButton *rateNowBtn;
- (IBAction)rateNowBtnTapped:(id)sender;
- (void)dismissPopup;

@property (strong, nonatomic) NSNumber *productId;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productImage;


@property (assign, nonatomic) NSNumber *setRating;
@property (strong, nonatomic) RatingViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
