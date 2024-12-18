//
//  ProductImagesViewCell.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductImagesViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *prodImage;

-(void) configure: (NSString *)prodImage;
@end

NS_ASSUME_NONNULL_END
