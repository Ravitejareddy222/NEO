//
//  AddToCartViewModel.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "AddToCartViewModel.h"

@implementation AddToCartViewModel

- (void)addToCart:(nonnull NSNumber *)productId quantity:(long)quantity {
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:productId forKey:@"product_id"];
    [self.params setObject:@(quantity) forKey:@"quantity"];
    
    [_addToCartProtocol addToCartData: _params completion:^(AddToCartResponse *_Nullable response, NSError *_Nullable error){
        if(error){
            self.addToCartFailure(@"error");
        }
        if (response.status.boolValue){
            self.addToCartSuccessful();
        }else{
            self.addToCartFailure(@"error");
        }
    }];
    
}

@end
