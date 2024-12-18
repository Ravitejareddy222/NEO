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
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopup)];
        [backgroundView addGestureRecognizer:tapGesture];
        [self.view addSubview:backgroundView];
        [self.view sendSubviewToBack:backgroundView];
    
    _viewModel = [[AddToCartViewModel alloc] init];
    self.viewModel.addToCartProtocol = [[AddToCartServices alloc] init];
    self.viewModel.addToCartSuccessful = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    };
}

- (void)dismissPopup {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitButtonTapped:(id)sender {
    NSString * qty = self.quantityTextField.text;
    long qtyLong = [qty longLongValue];
    [_viewModel addToCart: _productId  quantity: qtyLong];
}

@end
