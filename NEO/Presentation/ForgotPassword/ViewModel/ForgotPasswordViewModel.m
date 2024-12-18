//
//  ForgotPasswordViewModel.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "ForgotPasswordViewModel.h"

@implementation ForgotPasswordViewModel

-(void) forgotPassword: (NSString *) email{
    _params = [NSMutableDictionary dictionary];
    [self.params setObject:email forKey:@"email"];
    self.onStartLoading();
    
    [_forgotPasswordProtocol saveForgotPasswordDetails:_params completion:^(ForgotPasswordResponse *_Nullable response, NSError *_Nullable error){
        if(error){
            self.saveForgotPasswordDetailsFailure(@"Error");
        }
        if(response.status.intValue == 200){
            self.saveForgotPasswordDetailsSuccessful();
        }else{
            self.saveForgotPasswordDetailsFailure(@"Error");
        }
    }];
}
@end
