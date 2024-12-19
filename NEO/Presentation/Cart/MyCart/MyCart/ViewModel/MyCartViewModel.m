//
//  MyCartViewModel.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartViewModel.h"
#import "MyCartServices.h"

@implementation MyCartViewModel

- (void)getCartList {
    _params = [NSMutableDictionary dictionary];
    
    [_myCartProtocol getMyCartData:_params completion:^(MyCartResponse *_Nullable response, NSError *_Nullable error){
        if (error){
            self.myCartDetailsFetchFailure(@"Error");
        }
        
        if(response.status.boolValue){
            self.MyCartData = response.data;
            self.myCartDetailsFetchSuccessful();
        }else{
            self.myCartDetailsFetchFailure(@"Error");
        }
        
    }];
}

@end
