//
//  RegisterServices.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterServices.h"
#import "NetworkManager.h"
#import "RegisterAPIs.h"

@implementation RegisterServices

- (void)saveUserData:(NSDictionary *)params completion:(void (^)(UserResponse * _Nullable response, NSError * _Nullable error))completion {
    NSString *path = [RegisterAPIs saveRegisterDataPath];
    NSString *method = [RegisterAPIs method];

    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        UserResponse *userResponse = [[UserResponse alloc] initWithDictionary:data error:&jsonError];
        completion(userResponse, jsonError);
    }];
}

@end

