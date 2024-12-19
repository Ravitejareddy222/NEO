//
//  RatingCollectionViewCell.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RatingCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *starImage;
-(void) configure: (BOOL)filled color:(BOOL)gray;
@end

NS_ASSUME_NONNULL_END
