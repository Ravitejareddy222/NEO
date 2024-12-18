//
//  PlaceOrderServices.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "PlaceOrderServices.h"
#import "PlaceOrderAPIs.h"
#import "NetworkManager.h"

@implementation PlaceOrderServices

- (void)placeOrderData:(id)params completion:(nonnull void (^)(PlaceOrderResponse * _Nullable, NSError * _Nullable))completion {
    NSString *path = PlaceOrderAPIs.getPlaceOrderpath;
    NSString *method = PlaceOrderAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if(error){
            completion(nil, error);
        }else{
            PlaceOrderResponse *placeOrderResponse = [[PlaceOrderResponse alloc] initWithDictionary:data];
            completion(placeOrderResponse, nil);
        }
        
    }];
}

@end
