//
//  AddressViewModel.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "PlaceOrderViewModel.h"

@implementation PlaceOrderViewModel

- (void)placeOrder:selectedAddress {
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:selectedAddress forKey:@"address"];
    
    [_placeOrderProtocol placeOrderData:_params completion:^(PlaceOrderResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.placeOrderDetailsFetchFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.status = response.status;
            self.placeOrderDetailsFetchSuccessful();
        }else{
            self.placeOrderDetailsFetchFailure(@"Error");
        }
    }];
}

@end
