//
//  LoginViewModel.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "LoginViewModel.h"
#import "LoginModel.h"
#import "LoginServices.h"

@implementation LoginViewModel

- (void)saveLogin:(nonnull NSString *)username password:(nonnull NSString *)password {
    _params = [NSMutableDictionary dictionary];
    self.onStartLoading();
    
    [self.params setObject:username forKey:@"email"];
    [self.params setObject:password forKey:@"password"];
    
     self.loginProtocol = [[LoginServices alloc] init];
    [self.loginProtocol saveLoginDetails:_params completion:^(LoginResponse * _Nullable response, NSError * _Nullable error){
        
        if(error){
            self.loginDetailsFetchFailure(@"An error occurred while logging.");
        }
        if(response.status.boolValue){
            self.loginData = response.data;
            self.loginDetailsFetchSuccessfull();
        }else{
            self.loginDetailsFetchFailure(@"An error occurred while logging.");
        }
    }];
}

@end


