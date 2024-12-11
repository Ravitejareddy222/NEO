//
//  AddToCartViewController.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "AddToCartViewController.h"

@interface AddToCartViewController ()

@end

@implementation AddToCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[AddToCartViewModel alloc] init];
    self.viewModel.addToCartProtocol = [[AddToCartServices alloc] init];
}



- (IBAction)submitButtonTapped:(id)sender {
    NSString * qty = self.quantityTextField.text;
    long qtyLong = [qty longLongValue];
    [_viewModel addToCart: _productId  quantity: qtyLong];
}

@end
