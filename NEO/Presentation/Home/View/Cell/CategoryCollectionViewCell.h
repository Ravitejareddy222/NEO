//
//  CategoryCollectionViewCell.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *categoryImg;
@property (nonatomic, strong) IBOutlet UILabel *categoryLabel;
@property (nonatomic, strong) NSArray *categoryNameList;
@property (nonatomic, strong) NSArray *categoryImageList;


-(void) configure:(NSInteger)item;
@end

NS_ASSUME_NONNULL_END
