//
//  MyCartTableViewCell.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation MyCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(MyCartData *)data {
    _productName.text = data.myCartItemData.name;
    _productCategory.text = [NSString stringWithFormat:@"( %@ )", data.myCartItemData.productCategory];
    NSNumber *qty = data.quantity;
    NSString *productQty = [qty stringValue];
    _quantityTextField.text = productQty;
    NSString *imageUrlString = data.myCartItemData.productImage;
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
        
        [_productImage sd_setImageWithURL:imageUrl
                          placeholderImage:[UIImage imageNamed:@"placeholder"]
                                   options:SDWebImageRefreshCached
                                   completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            if (error) {
                NSLog(@"Error loading image: %@", error.localizedDescription);
            }
        }];

}

@end
