//
//  AddToCartServices.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "AddToCartServices.h"
#import "AddToCartAPIs.h"
#import "NetworkManager.h"
#import "AddToCartModel.h"

@implementation AddToCartServices

- (void)addToCartData:(nonnull NSDictionary *)params completion:(nonnull void (^)(AddToCartResponse * _Nullable, NSError * _Nullable))completion {
    NSString *path = AddToCartAPIs.getAddToCartPath;
    NSString *method = AddToCartAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if(error){
            completion(nil, error);
        }else{
            AddToCartResponse *addToCartResponse = [[AddToCartResponse alloc] initWithDictionary:data];
            completion(addToCartResponse, nil);
        }
        
    }];
}

@end
