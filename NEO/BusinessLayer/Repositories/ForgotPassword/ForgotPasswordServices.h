//
//  ForgotPasswordServices.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
#import "ForgotPasswordModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ForgotPasswordServicesProtocol <NSObject>

-(void) saveForgotPasswordDetails: (NSDictionary *)params completion: (void (^)(ForgotPasswordResponse * _Nullable response, NSError *_Nullable error))completion;

@end

@interface ForgotPasswordServices : NSObject<ForgotPasswordServicesProtocol>

@end

NS_ASSUME_NONNULL_END
