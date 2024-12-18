//
//  ResetpasswordServices.h
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import <Foundation/Foundation.h>
#import "ResetPasswordModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ResetpasswordServicesProtocol <NSObject>

-(void) saveResetPasswordDetails: (NSDictionary *)params completion: (void (^)(ResetPasswordResponse * _Nullable response, NSError *_Nullable error))completion;

@end
@interface ResetpasswordServices : NSObject<ResetpasswordServicesProtocol>

@end

NS_ASSUME_NONNULL_END
