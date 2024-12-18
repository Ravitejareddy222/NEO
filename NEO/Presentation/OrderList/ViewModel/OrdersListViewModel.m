//
//  OrdersListViewModel.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrdersListViewModel.h"
#import "OrdersListServices.h"

@implementation OrdersListViewModel

- (void)ordersList {
    _params = [NSMutableDictionary dictionary];
    
    [_ordersListProtocol getOrdersList:_params completion:^(OrdersListResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.ordersListDetailsFetchFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.ordersListData = response.data;
            self.ordersListDetailsFetchSuccessful();
        }else{
            self.ordersListDetailsFetchFailure(@"Error");
        }
        
    }];
}

@end
