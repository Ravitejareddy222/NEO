//
//  OrderDetailsViewModell.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrderDetailsViewModel.h"
#import "OrderDetailsServices.h"

@implementation OrderDetailsViewModel

-(void) orderDetails: (NSNumber *)orderId{
    _params = [NSMutableDictionary dictionary];
    [self.params setObject: orderId forKey:@"order_id"];
    
    [_orderDetailsProtocol getOrderDetails:_params completion:^(OrderDetailsResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.orderDetailsFetchFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.itemDetails = response.data.orderDetails;
            self.orderDetailsFetchSuccessful();
        }else{
            self.orderDetailsFetchFailure(@"Error");
        }
        
    }];
}

@end
