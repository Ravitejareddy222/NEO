//
//  ProductListViewModel.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "ProductListViewModel.h"
#import "ProductListServices.h"


@implementation ProductListViewModel

- (void)getProductList:(NSInteger)categoryType {
    _params = [NSMutableDictionary dictionary];
    int limit = 10;
    int page = 1;
    [self.params setObject: @(categoryType) forKey:@"product_category_id"];
    [self.params setObject: @(limit) forKey:@"limit"];
    [self.params setObject: @(page) forKey:@"page"];
    
     
    [_productListprotocol getproductListData: _params completion: ^(ProductListResponse * _Nullable response, NSError * _Nullable error){
        if(error){
            self.productListFetchFailure(@"error");
            return;
        }
        if(response.status.boolValue){
            self.productList = response.data;
            self.productListFetchSuccessfull();
        }else{
            self.productListFetchFailure(@"error");
        }
    }];
    
}

@end


