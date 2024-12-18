//
//  ForgotPasswordServices.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "ForgotPasswordServices.h"
#import "ForgotPasswordAPIs.h"
#import "NetworkManager.h"

@implementation ForgotPasswordServices

- (void)saveForgotPasswordDetails:(nonnull NSDictionary *)params completion:(nonnull void (^)(ForgotPasswordResponse * _Nullable, NSError * _Nullable))completion {
    NSString *path = ForgotPasswordAPIs.getForgotPasswordPath;
    NSString *method = ForgotPasswordAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            ForgotPasswordResponse *forgotPasswordResponse = [[ForgotPasswordResponse alloc] initWithDictionary: data];
            completion(forgotPasswordResponse, nil);
        }
        
    }];
}

@end
