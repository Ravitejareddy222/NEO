//
//  OrdersListServices.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrdersListServices.h"
#import "OrdersListAPIs.h"
#import "NetworkManager.h"

@implementation OrdersListServices

- (void)getOrdersList:(id)params completion:(nonnull void (^)(OrdersListResponse * _Nullable, NSError * _Nullable))completion {
    NSString *path = OrdersListAPIs.getOrderListpath;
    NSString *method = OrdersListAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if(error){
            completion(nil, error);
        }else{
            OrdersListResponse *ordersListResponse = [[OrdersListResponse alloc] initWithDictionary:data];
            completion(ordersListResponse, nil);
        }
        
    }];
}

@end
