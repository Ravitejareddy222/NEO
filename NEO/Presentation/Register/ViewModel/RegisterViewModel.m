//
//  RegisterViewModel.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterViewModel.h"
#import "NetworkManager.h"
#import "RegisterServices.h" 

@implementation RegisterViewModel

- (void)saveUser:(nonnull NSString *)firstname lastname:(nonnull NSString *)lastname email:(nonnull NSString *)email password:(nonnull NSString *)password confirmPassword:(nonnull NSString *)confirmPassword phoneNumber:(nonnull NSString *)phoneNumber gender:(nonnull NSString *)gender {
    
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:@"first_name" forKey:firstname];
    [self.params setObject:@"last_name" forKey:lastname];
    [self.params setObject:@"email" forKey:email];
    [self.params setObject:@"password" forKey:password];
    [self.params setObject:@"confirm_password" forKey:confirmPassword];
    [self.params setObject:@"gender" forKey:gender];
    [self.params setObject:@"phone_no" forKey:phoneNumber];
    
    [self.registerProtocol saveUserData:_params completion:^(UserResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                //[self registerDetailFetchFailure:@"An error occurred while registering."];
                return;
            }
            
            if (response.status.boolValue) {
               // [self registerDetailFetchSuccessful];
            } else {
               // [self registerDetailFetchFailure:response.userMsg ?: @"Registration failed."];
            }
        }];
}

@end

