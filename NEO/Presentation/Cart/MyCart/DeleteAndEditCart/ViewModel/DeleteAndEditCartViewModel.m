//
//  DeleteAndEditCartViewModel.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "DeleteAndEditCartViewModel.h"

@implementation DeleteAndEditCartViewModel

- (void)deleteCart:(nonnull NSNumber *)productId {
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:productId forKey:@"product_id"];
    
    [_deleteEditProtocol saveDeleteCart:_params completion:^(DeleteCartResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.deleteCartFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.deleteCartSuccessful();
        }else{
            self.deleteCartFailure(@"Error");
        }
        
    }];
}

-(void) editCart: (NSNumber *)productId quantity: (NSNumber *)quantity; {
    _params = [NSMutableDictionary dictionary];
    [self.params setObject:productId forKey:@"product_id"];
    [self.params setObject:quantity forKey:@"quantity"];
    
    [_deleteEditProtocol saveEditCart:_params completion:^(EditCartResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.editCartFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.editCartSuccessful();
        }else{
            self.editCartFailure(@"Error");
        }
        
    }];
}

@end
