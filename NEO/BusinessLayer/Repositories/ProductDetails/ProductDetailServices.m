//
//  ProductDetailServices.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailServices.h"
#import "ProductDetailsAPIs.h"
#import "NetworkManager.h"
#import "ProductDetailsModel.h"

@implementation ProductDetailServices

- (void)getProductDetailsData:(nonnull NSDictionary *)params completion:(nonnull void (^)(ProductDetailsResponse * _Nullable, NSError * _Nullable))completion {
    
    completion = [completion copy];
    NSString *method = ProductDetailsAPIs.method;
    NSString *path = ProductDetailsAPIs.getProductDetailsPath;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath: path
                                                         method: method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if (error){
            completion(nil, error);
        }else {
            NSError *jsonError;
            if ([data isKindOfClass:[NSDictionary class]]) {
                ProductDetailsResponse *productDetailsResponse = [[ProductDetailsResponse alloc] initWithDictionary:data error:&jsonError];
                if (jsonError) {
                    NSLog(@"Error parsing JSON: %@", jsonError.localizedDescription);
                    completion(nil, jsonError);
                } else {
                    completion(productDetailsResponse, nil);
                }
            } 
        }
    }];
}

@end
