//
//  ResetpasswordServices.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ResetpasswordServices.h"
#import "ResetPasswordAPIs.h"
#import "NetworkManager.h"

@implementation ResetpasswordServices

-(void) saveResetPasswordDetails: (NSDictionary *)params completion: (void (^)(ResetPasswordResponse * _Nullable response, NSError *_Nullable error))completion {
    NSString *path = ResetPasswordAPIs.getResetPasswordPath;
    NSString *method = ResetPasswordAPIs.method;
    
    [[NetworkManager sharedInstance] performDataRequestWithPath:path
                                                         method:method
                                                     parameters:params
                                                     completion:^(id _Nullable data, NSError *_Nullable error){
        if(error){
            completion(nil, error);
        }else{
            ResetPasswordResponse *resetPasswordResponse = [[ResetPasswordResponse alloc] initWithDictionary: data];
            completion(resetPasswordResponse, nil);
        }
        
    }];
}
@end
