//
//  MyCartServices.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartServices.h"
#import "MyCartAPIs.h"
#import "NetworkManager.h"

@implementation MyCartServices

- (void)getMyCartData:(id)params completion:(nonnull void (^)(MyCartResponse * _Nullable, NSError * _Nullable))completion {
    
    NSString *path = MyCartAPIs.getMyCartpath;
    NSString *meethod = MyCartAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:meethod
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            NSError *jsonError;
            MyCartResponse *myCartResponse = [[MyCartResponse alloc] initWithDictionary: data];
            completion(myCartResponse, nil);
        }
        
    }];
}

@end
