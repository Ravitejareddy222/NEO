//
//  OrderDetailsServices.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "OrderDetailsServices.h"
#import "OrderDetailsAPIs.h"
#import "NetworkManager.h"

@implementation OrderDetailsServices

- (void)getOrderDetails:(id)params completion:(nonnull void (^)(OrderDetailsResponse * _Nullable, NSError * _Nullable))completion {
    NSString *path = OrderDetailsAPIs.getOrderDetailspath;
    NSString *method = OrderDetailsAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if(error){
            completion(nil, error);
        }else{
            OrderDetailsResponse *orderDetailsResponse = [[OrderDetailsResponse alloc] initWithDictionary:data];
            completion(orderDetailsResponse, nil);
        }
        
    }];
}

@end
