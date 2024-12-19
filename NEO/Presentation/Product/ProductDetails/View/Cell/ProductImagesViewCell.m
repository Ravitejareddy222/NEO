//
//  ProductImagesViewCell.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "ProductImagesViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation ProductImagesViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void) configure: (NSString *)prodImage{
    NSURL *imageURL = [NSURL URLWithString:prodImage];

    [_prodImage sd_setImageWithURL:imageURL
                     placeholderImage:[UIImage imageNamed:@"placeholder"]
                              options:SDWebImageHighPriority
                            completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            NSLog(@"Error loading image: %@", error.localizedDescription);
        }
    }];
}

@end
