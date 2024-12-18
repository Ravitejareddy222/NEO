//
//  AddreessViewCell.m
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import "AddressViewCell.h"

@implementation AddressViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(nonnull NSString *)address {
    _addressLabel.text = address;
}

@end
