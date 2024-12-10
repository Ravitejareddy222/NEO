//
//  LoginServices.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LoginServicesProtocol <NSObject>

-(void) saveLoginDetails: (NSDictionary *)params
              completion: (void (^)(LoginResponse * _Nullable response,
                                          NSError * _Nullable error))completion;
                       
@end

@interface LoginServices : NSObject <LoginServicesProtocol>

@end

NS_ASSUME_NONNULL_END
