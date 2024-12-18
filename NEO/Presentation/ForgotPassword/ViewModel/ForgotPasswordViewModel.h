//
//  ForgotPasswordViewModel.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
#import "ForgotPasswordServices.h"

@class ForgotPasswordResponsehandler;

typedef void (^ForgotPasswordSuccessBlock)(void);
typedef void (^ForgotPasswordFailureBlock)(NSString  * _Nullable errorMessage);
typedef void (^StartLoadingBlock)(void);


NS_ASSUME_NONNULL_BEGIN

@interface ForgotPasswordViewModel : NSObject

@property (nonatomic, strong) ForgotPasswordSuccessBlock saveForgotPasswordDetailsSuccessful;
@property (nonatomic, strong) ForgotPasswordFailureBlock saveForgotPasswordDetailsFailure;
@property (nonatomic, strong) StartLoadingBlock onStartLoading;

@property (nonatomic, strong) NSMutableDictionary *params;
-(void) forgotPassword: (NSString *) email;

@property (nonatomic, strong) id<ForgotPasswordServicesProtocol> forgotPasswordProtocol;


@end

NS_ASSUME_NONNULL_END
