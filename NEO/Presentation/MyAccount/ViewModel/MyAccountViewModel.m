//
//  MyAccountViewModel.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountViewModel.h"

@implementation MyAccountViewModel

- (void)getAccountDetails {
    _params = [NSMutableDictionary dictionary];
    self.onStartLoading();
    
    [_myAccountProtocol getAccountData:_params completion:^(MyAccountDetailsFetchResponse *_Nullable response, NSError *_Nullable error){
        if(error){
            self.myAccountDetailsFetchFailure(@"EError");
        }
        if(response.status.boolValue){
            self.accountData = response.data;
            self.myAccountDetailsFetchSuccessful();
        } else{
            self.myAccountDetailsFetchFailure(@"EError");
        }
        
    }];
    
}

- (void)saveAccountData:(nonnull NSString *)firstName lastName:(nonnull NSString *)lastName email:(nonnull NSString *)email dob:(nonnull NSString *)dob phoneNumber:(nonnull NSString *)phoneNumber personImage: (nonnull NSString *)personImage{
    self.onStartLoading();
    _params = [NSMutableDictionary dictionary];
    
    [self.params setObject:firstName forKey:@"first_name"];
    [self.params setObject:lastName forKey:@"last_name"];
    [self.params setObject:email forKey:@"email"];
    [self.params setObject:dob forKey:@"dob"];
    [self.params setObject:phoneNumber forKey:@"phone_no"];
    [self.params setObject:personImage forKey:@"profile_pic"];

    
    
    [_myAccountProtocol saveAccountData:_params completion:^(MyAccountDetailsSaveResponse *_Nullable response, NSError *_Nullable error){
        if(error){
            self.myAccountDetailsSaveFailure(@"EError");
        }
        if(response.status.boolValue){
            self.myAccountDetailsSaveSuccessful();
        } else{
            self.myAccountDetailsSaveFailure(@"EError");
        }
        
    }];
}

@end
