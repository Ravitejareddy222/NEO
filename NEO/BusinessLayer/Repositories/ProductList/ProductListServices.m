//
//  ProductListServices.m
//  NEO
//
//  Created by Neo on 10/12/24.
//

#import "ProductListServices.h"
#import "NetworkManager.h"
#import "ProductListAPIs.h"

@implementation ProductListServices

- (void)getproductListData:(nonnull NSDictionary *)params completion:(nonnull void (^)(ProductListResponse * _Nullable, NSError * _Nullable))completion {
    
    NSString * method = ProductListAPIs.method;
    NSString *path = ProductListAPIs.getProductListDataPath;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                        method:method
                                                        parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        
        if (error){
            completion(nil, error);
        } else{
            NSError *jsonError;
            ProductListResponse *productListResponse = [[ProductListResponse alloc] initWithDictionary:data error:&jsonError];
            completion(productListResponse, jsonError);
        }
    }];
}

@end
