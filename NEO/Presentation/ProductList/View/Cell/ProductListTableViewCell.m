//
//  ProductListTableViewCell.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation ProductListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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

@end


