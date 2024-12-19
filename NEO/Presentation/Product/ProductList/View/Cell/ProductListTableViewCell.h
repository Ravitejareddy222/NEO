//
//  ProductListTableViewCell.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <UIKit/UIKit.h>
#import "ProductListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductListTableViewCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>
-(void) configure: (ProductData *)data;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *productProducer;
@property (strong, nonatomic) IBOutlet UILabel *productCost;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;

@property (strong, nonatomic) NSNumber *rating;
@property (strong, nonatomic) IBOutlet UICollectionView *ratingCollectionView;

@end

NS_ASSUME_NONNULL_END
