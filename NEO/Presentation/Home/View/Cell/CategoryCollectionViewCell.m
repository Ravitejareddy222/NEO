//
//  CategoryCollectionViewCell.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _categoryNameList = @[@"Tables", @"Sofas", @"Chairs", @"Cupboards"];
    _categoryImageList = @[@"table", @"Sofa_01", @"chair", @"cupboard-icon"];
}

-(void) configure: (NSInteger)item{
    self.categoryLabel.text = _categoryNameList[item];
    self.categoryImg.image = [UIImage imageNamed:_categoryImageList[item]];
}

@end
