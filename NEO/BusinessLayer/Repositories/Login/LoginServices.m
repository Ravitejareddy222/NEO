//
//  LoginServices.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "LoginServices.h"
#import "NetworkManager.h"
#import "LoginAPIs.h"

@implementation LoginServices

- (void)saveLoginDetails:(nonnull NSDictionary *)params completion:(nonnull void (^)(LoginResponse * _Nullable, NSError * _Nullable))completion {
    
    NSString *path = [LoginAPIs saveLoginDataPath];
    NSString *method = [LoginAPIs method];
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error){
        if (error){
            completion(nil, error);
        }else{
            NSError *jsonError;
            if(data){
                LoginResponse *loginresponse = [[LoginResponse alloc] initWithDictionary:data error:&jsonError];
                completion(loginresponse, jsonError);
            }else{
                completion(nil, nil);
            }
        }
    }];
}

@end
