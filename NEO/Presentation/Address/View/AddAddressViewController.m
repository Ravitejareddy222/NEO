//
//  AddAddressViewController.m
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import "AddAddressViewController.h"
#import "Storage.h"

@interface AddAddressViewController ()

@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)saveAddressBtnTapped:(id)sender {
    NSString * address = _addressTextView.text;
    NSString *landmark = _landmark.text;
    NSString *city = _city.text;
    NSString *state = _state.text;
    NSString *zipCode = _zipCode.text;
    NSString *country = _country.text;
    
    if (address.length > 0 &&
            landmark.length > 0 &&
            city.length > 0 &&
            state.length > 0 &&
            zipCode.length > 0 &&
            country.length > 0) {
        
        NSString *fullAddress = [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@,", address, landmark, city, state, zipCode, country];
        
        [Storage saveAddrress:fullAddress];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
    }
}
@end
