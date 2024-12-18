//
//  ResetPasswordViewModel.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <Foundation/Foundation.h>
#import "ResetpasswordServices.h"

@class ResetPasswordResponseHandler;

typedef void (^ResetPasswordSuccessBlock)(void);
typedef void (^ResetPasswordFailureBlock)(NSString *_Nullable errorMessage);
typedef void (^StartLoadingBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ResetPasswordViewModel : NSObject
@property (nonatomic, strong) ResetPasswordSuccessBlock newPasswordSaveSuccessful;
@property (nonatomic, strong) ResetPasswordFailureBlock newPasswordSaveFailure;
@property (nonatomic, strong) StartLoadingBlock onStartLoading;


@property (nonatomic, strong) NSMutableDictionary *params;

-(void) setNewPassword: (NSString *)currentPassword newPassword: (NSString *)newPassword confirmPassword:(NSString *)confirmPassword;

@property (nonatomic, strong) id<ResetpasswordServicesProtocol> resetPasswordProtocol;
@end

NS_ASSUME_NONNULL_END
