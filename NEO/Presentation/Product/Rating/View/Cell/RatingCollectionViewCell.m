//
//  RatingCollectionViewCell.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "RatingCollectionViewCell.h"

@implementation RatingCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void) configure: (BOOL)filled color:(BOOL)gray{
    if(filled){
        _starImage.image = [UIImage imageNamed:@"starFill"];
    }else{
        if(gray){
            _starImage.image = [UIImage imageNamed:@"stargray"];
        }else{
            _starImage.image = [UIImage imageNamed:@"star_unchek"];
        }
    }
}

@end
