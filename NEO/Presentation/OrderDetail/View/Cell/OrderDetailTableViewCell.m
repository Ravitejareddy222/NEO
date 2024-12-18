//
//  OrderDetailTableViewCell.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "OrderDetailTableViewCell.h"
#import <SDWebImage/SDWebImage.h>


@implementation OrderDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configure: (ItemDetails *)data{
    _prodName.text = data.productName;
    _prodCategory.text = [NSString stringWithFormat:@"(%@)", data.productCategory];
    NSNumber *qty = data.quantity;
    _quantity.text = [NSString stringWithFormat:@"QTY: %@", qty];
    NSNumber *totalCost = data.total;
    _cost.text = [NSString stringWithFormat:@"₹ %@", totalCost];
    
    NSString *imageUrlString = data.productImage;
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
        
    [_prodImage sd_setImageWithURL:imageUrl
                          placeholderImage:[UIImage imageNamed:@"placeholder"]
                                   options:SDWebImageRefreshCached
                                   completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            if (error) {
                NSLog(@"Error loading image: %@", error.localizedDescription);
            }
        }];
}

@end
