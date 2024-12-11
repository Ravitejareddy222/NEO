//
//  LoginViewModel.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>
#import "LoginServices.h"

NS_ASSUME_NONNULL_BEGIN

@class HandleLoginResponse;

typedef void (^LoginSuccessBlock)(void);
typedef void (^LoginFailureBlock) (NSString *errorMessage);

@interface LoginViewModel : NSObject

@property (copy, nonatomic) LoginSuccessBlock loginDetailsFetchSuccessfull;
@property (copy, nonatomic) LoginFailureBlock loginDetailsFetchFailure;

-(void) saveLogin: (NSString *)username password: (NSString *)password;

@property (strong, nonatomic) NSMutableDictionary *params;
@property (strong, nonatomic) LoginData *loginData;

@property (nonatomic, strong) id<LoginServicesProtocol> loginProtocol;
@end

NS_ASSUME_NONNULL_END
