//
//  RegisterServices.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>
#import "RegisterModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterServicesProtocol <NSObject>

- (void)saveUserData:(NSDictionary *)params completion:(void (^)(UserResponse * _Nullable response, NSError * _Nullable error))completion;
@end

@interface RegisterServices : NSObject <RegisterServicesProtocol>

@end

NS_ASSUME_NONNULL_END
