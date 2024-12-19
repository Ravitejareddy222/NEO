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
    [self pickerSetUp];
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

-(void)pickerSetUp {
   self.numberPicker = [[UIPickerView alloc] init];
   self.numberPicker.delegate = self;
   self.numberPicker.dataSource = self;
   self.quantityTextField.inputView = self.numberPicker;
   
   self.quantity = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.quantity.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@", self.quantity[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger selectedQuantity = [self.quantity[row] integerValue];
    self.quantityTextField.text = [NSString stringWithFormat:@"%ld", (long)selectedQuantity];
    
    if (self.indexPath != NSNotFound) {
        // Notify delegate that the quantity has changed
        [self.delegate didQuantityChange:selectedQuantity atIndex:self.indexPath];
    }
}

- (void)setUpView {
}

@end
