//
//  ButtonViewCell.m
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import "ButtonViewCell.h"

@implementation ButtonViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _orderButton.layer.cornerRadius = 10;
    _orderButton.layer.masksToBounds = YES;
}

-(void) configureForTotalCost: (NSNumber *)cost{
    
}


-(void) configureForOrderDetails: (NSNumber *)cost{
    _totalCostLabel.text = [NSString stringWithFormat:@"%@", cost];
    [_orderButton setHidden:YES];
}


- (IBAction)orderButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(orderBtnTapped)]) {
            [self.delegate orderBtnTapped];
        }
}
@end
