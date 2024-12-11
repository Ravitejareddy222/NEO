//
//  ProductDetailsViewModel.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailsViewModel.h"

@implementation ProductDetailsViewModel

- (void)getProductDetails:(long)productId {
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:@(productId) forKey:@"product_id"];
    
    [_productDetailsProtocol getProductDetailsData:_params completion: ^(ProductDetailsResponse * _Nullable response, NSError * _Nullable error){
        
        if (error){
            self.getProductDetailsFailure(@"error");
        }
        if (response.status.boolValue){
            self.productDetails = response.data;
            self.getProductDetailsSuccessfull();
        }else{
            self.getProductDetailsFailure(@"error");
        }
        
    }];
}

-(NSString *) getProductCategory: (NSNumber *)productCategoryId{
    switch (productCategoryId.intValue){
    case 1: return @"Category - Tables";
    case 2: return @"Category - Sofas";
    case 3: return @"Category - Chairs";
    case 4: return @"Category - Cupboards";
    default: return @"";
    }
}
@end
