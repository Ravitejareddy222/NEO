//
//  DeleteAndEditCartServices.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "DeleteAndEditCartServices.h"
#import "DeleteAndEditCartAPIs.h"
#import "NetworkManager.h"

@implementation DeleteAndEditCartServices

- (void)saveDeleteCart:params completion:(nonnull void (^)(DeleteCartResponse * _Nullable, NSError * _Nullable))completion {
    
        NSString *path = DeleteAndEditCartAPIs.getdeleteCartpath;
        NSString *method = DeleteAndEditCartAPIs.getdeleteCartMethod;
        
        [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                             method:method
                                                         parameters:params
                                                         completion:^(id _Nullable data, NSError * _Nullable error){
            if(error){
                completion(nil, error);
            }else{
                DeleteCartResponse *deleteCartResponse = [[DeleteCartResponse alloc] initWithDictionary:data];
                completion(deleteCartResponse, nil);
            }
            
        }];
}

- (void)saveEditCart: params completion:(nonnull void (^)(EditCartResponse * _Nullable, NSError * _Nullable))completion {

        NSString *path = DeleteAndEditCartAPIs.getEditCartpath;
        NSString *method = DeleteAndEditCartAPIs.getEditCartMethod;
        
        [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                             method:method
                                                         parameters:params
                                                         completion:^(id _Nullable data, NSError * _Nullable error){
            if(error){
                completion(nil, error);
            }else{
                EditCartResponse *editCartResponse = [[EditCartResponse alloc] initWithDictionary:data];
                completion(editCartResponse, nil);
            }
            
        }];
}

@end
