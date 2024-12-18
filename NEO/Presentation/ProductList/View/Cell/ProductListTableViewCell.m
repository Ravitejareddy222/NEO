//
//  ProductListTableViewCell.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "RatingCollectionViewCell.h"

@implementation ProductListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.ratingCollectionView.delegate = self;
    self.ratingCollectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"RatingCollectionViewCell" bundle:nil];
    [self.ratingCollectionView registerNib:nib forCellWithReuseIdentifier:@"RatingCollectionViewCell"];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.ratingCollectionView.collectionViewLayout;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(13, 13);
        [flowLayout invalidateLayout];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)configure:(ProductData *)data {
    _productName.text = data.name;
    _productProducer.text = data.producer;
    _productCost.text = [NSString stringWithFormat:@"RS. %@", data.cost];
    
    if (data.productImages.length > 0) {
        NSURL *imageURL = [NSURL URLWithString:data.productImages];
    
        [_productImage sd_setImageWithURL:imageURL
                         placeholderImage:[UIImage imageNamed:@"placeholder"]
                                  options:SDWebImageHighPriority
                                completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
                NSLog(@"Error loading image: %@", error.localizedDescription);
            }
        }];
    }
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RatingCollectionViewCell *cell = (RatingCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"RatingCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(16, 16);
}
@end


