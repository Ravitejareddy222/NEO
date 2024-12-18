//
//  ResetPasswordViewModel.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ResetPasswordViewModel.h"

@implementation ResetPasswordViewModel
-(void) setNewPassword: (NSString *)currentPassword newPassword: (NSString *)newPassword confirmPassword:(NSString *)confirmPassword {
    _params = [NSMutableDictionary dictionary];
    [self.params setObject:currentPassword forKey:@"old_password"];
    [self.params setObject:newPassword forKey:@"password"];
    [self.params setObject:confirmPassword forKey:@"confirm_password"];
    
    //self.onStartLoading();
    
    [_resetPasswordProtocol saveResetPasswordDetails:_params completion:^(ResetPasswordResponse *_Nullable response, NSError *_Nullable error){
        if(error){
            self.newPasswordSaveFailure(@"Error");
        }
        if(response.status.intValue == 200){
            self.newPasswordSaveSuccessful();
        }else{
            self.newPasswordSaveFailure(@"Error");
        }
    }];
}
@end
